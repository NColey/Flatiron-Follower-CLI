class Controller
	attr_accessor :scrape, :twitter, :username_array, :twitter_username_hash, :twitter_handle

	def initialize(twitter_handle)
		@scrape = Scraper.new
        @twitter = TwitterApi.new
        @username_array = scrape.remove_self_from_array(twitter_handle)
        @twitter_username_hash = scrape.remove_self_from_hash(twitter_handle)
	end

	def follow_your_classmates
        twitter.follow(username_array)
        view = FollowEveryone.new
        view.render
        
    end

    def follow_one_classmate
        puts "Please enter the name of the classmate you want to follow."
        name = gets.chomp
        twitter_handle = twitter_username_hash[name]
        twitter.follow(twitter_handle)
        puts "You have followed #{twitter_handle}."
    end

    def tweet
        view = ChooseAClassmateToTweetAt.new
        view.render
        name = gets.chomp
        twitter_handle = twitter_username_hash[name]
        puts "Please enter your tweet"
        message = gets.chomp
        tweet = "@#{twitter_handle} #{message}"
        twitter.tweet_at_classmate(tweet)
        puts "You have tweeted at #{twitter_handle}!"
    end

    def view_timeline
        view = ViewStudentTimeline.new
        name = view.render
        twitter_handle = twitter_username_hash[name]
        twitter.classmate_timeline(twitter_handle)
    end

    def unfollow_all_classmates
        twitter.unfollow(username_array)
        puts "You've unfollowed everyone."
    end

    def unfollow_one_classmate
        puts "Please enter the name of the classmate you want to unfollow."
        name = gets.chomp
        twitter_handle = twitter_username_hash[name]
        twitter.unfollow(twitter_handle)
        puts "You have unfollowed #{twitter_handle}"
    end
end