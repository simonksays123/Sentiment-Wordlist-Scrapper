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

