# frozen_string_literal: true

# =begin
#   Holds helper functions needed to scrape synonyms from Thesaurus.com
# =end
module Interactions
  # =begin
  #   Given a word, finds all synonyms of the highest ranking on thesaurus.com
  # =end
  def self.find_synonyms(word, agent)
    page = agent.get(URI(URL_BASE + word.gsub(' ', '%20')))
    page.css('a.css-1s3v085').map { |node| node.text.strip }
  end

  # =begin
  #   Returns true if word_list contains the word
  # =end
  def self.check_word(word, word_list)
    word_list.reduce(false) { |acc, item| acc || item[0] == word[0] }
  end

  # =begin
  #   Compacts list to a string of just the words along with newlines and level indicators
  # =end
  def self.format_list(list)
    curr_level = -1
    list.reduce('') do |acc, item|
      if item[1] != curr_level
        curr_level = item[1]
        acc += "Level #{curr_level}\n"
      end
      "#{acc + item[0]}\n"
    end
  end
end
