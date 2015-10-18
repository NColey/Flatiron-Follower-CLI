require 'pry'
require 'Nokogiri'
require 'open-uri'
require 'twitter'
require 'yaml'

require_relative '../lib/twitter.rb'
require_relative '../lib/scraper.rb'
require_relative '../views/follow/follow_everyone.rb'
require_relative '../views/tweet/choose_a_classmate_to_tweet.rb'
require_relative '../views/view_timeline/view_student_timeline.rb'
require_relative '../views/unfollow/unfollow_all_classmates.rb'
require_relative '../views/unfollow/unfollow_all_classmates_error.rb'
require_relative '../views/unfollow/unfollow_one_classmate.rb'
require_relative '../views/unfollow/unfollow_one_classmate_success.rb'
require_relative '../controllers/application_controller.rb'
require_relative '../lib/TwitterCli.rb'

