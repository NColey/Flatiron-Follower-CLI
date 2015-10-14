require 'pry'
require 'Nokogiri'
require 'open-uri'
require 'twitter'
require 'yaml'

require_relative '../lib/twitter.rb'
require_relative '../lib/scraper.rb'
require_relative '../lib/TwitterCli.rb'

def reload!
  load 'lib/twitter.rb'
  load '../lib/scraper.rb'
  load '../lib/TwitterCli.rb'
end

Pry.start

