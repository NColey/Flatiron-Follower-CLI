require_relative '../config/environment'

class TwitterCli
  def call 
    puts "What do you want to do?"
    command = gets.chomp.to_i
    if command == 1
      scrape = Scraper.new.username_array
      twitter = TwitterApi.new
      twitter.follow_all(scrape)
      puts "You have followed everyone."
    end
  end
end

TwitterCli.new.call