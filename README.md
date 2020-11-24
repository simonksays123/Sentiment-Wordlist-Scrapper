# Sentiment-Wordlist-Scrapper

## How to Install

Firstly, clone the repository locally.

Next install ruby.
Installation instructions can be found at:
```
https://www.ruby-lang.org/en/documentation/installation/
```

Install the bundler gem to simplify installation of additional gems.
```
gem install bundler
```

Finally, install the remaining gems specificed in the Gemfile utilizing the bundler gem previously installed.
```
bundle install
```

## How to Run

To run the program as is, merely type:
```
ruby scraper.rb
```

Since the output for the current setup is provided, it is advisable that you change some setting or seed list before doing so to avoid unneeded work.

Recommended things to edit:
* LAYERS in scraper.rb
  * Be careful with runtime when increasing this value
* Seed word lists
  * negative_seed.txt for negative seed words
  * positive_seed.txt for positive seed words

## All the Files

Here's a quick explanation of each file in this repository.

**Code Files**
* Gemfile and Gemfile.lock
  * Used by the bundler gem to simplify installation of gem dependencies
* interactions.rb
  * Module containing functions which add readability to core file via abstraction
* scraper.rb
  * Core ruby file. Handles queue of words to be processed directly

**Input Files**
* negative_seed.txt
  * Contains seed words for list of negative words
* positive_seed.txt
  * Contains seed words for list of positive words

**Output Files**
* neg_raw_list.txt and pos_raw_list.txt
  * Contains negative and positive word lists with extra information
  * Format: {Word}-{Level, number of synonym jumps made to arrive at the given word}-{p for positive or n for negative}-{Parent word, blank for seed words}
* negative_word_list.txt and positive_word_list.txt
  * Negative and positive word lists
  * Note that "Level" information is included. These lines should be removed before using the word lists

**Documentation**
* README.md
  * It's this file which hopefully explains this program
* LICENSE
  * MIT License
  * Explains the legality of use of this code
