# frozen_string_literal: true

# All requirred modules
require 'mechanize'
require_relative 'interactions'

# Constants
WAIT_TIME = 0.01
LAYERS = 3
URL_BASE = 'https://www.thesaurus.com/browse/'
POS_SEEDS = File.read('positive_seed.txt').split.map { |word| [word, 0, 'p', ''] }
NEG_SEEDS = File.read('negative_seed.txt').split.map { |word| [word, 0, 'n', ''] }

# Active variables used to transverse pages
agent = Mechanize.new
word_queue = POS_SEEDS + NEG_SEEDS
pos_word_list = []
neg_word_list = []

# Scrape webpage of each word
while word_queue.size.positive?
  word = word_queue.shift

  # Skips word if it's already used
  next if Interactions.check_word(word, pos_word_list + neg_word_list)

  # Doesn't scrape children if limit it reached
  if word[1] < LAYERS
    # Avoids DOS attack
    sleep(WAIT_TIME)
    synonyms = Interactions.find_synonyms(word[0], agent).map { |syn| [syn, word[1] + 1, word[2], word[0]] }
    synonyms.each { |syn| word_queue << syn }
  end

  # Handles populating word lists
  if word[2] == 'p'
    pos_word_list << word
  else
    neg_word_list << word
  end
end

# Raw output
File.open('pos_raw_list.txt', 'w') { |f| f.write pos_word_list.reduce('') { |acc, item| "#{acc + item.join('-')}\n" } }
File.open('neg_raw_list.txt', 'w') { |f| f.write neg_word_list.reduce('') { |acc, item| "#{acc + item.join('-')}\n" } }

# Formatted output
File.open('positive_word_list.txt', 'w') { |f| f.write Interactions.format_list pos_word_list }
File.open('negative_word_list.txt', 'w') { |f| f.write Interactions.format_list neg_word_list }

# Close agent
agent.shutdown
