class Controller
	attr_accessor :scrape, :twitter, :username_array, :twitter_username_hash, :twitter_handle

	def initialize(twitter_handle)
		@scrape = Scraper.new
        @twitter = TwitterApi.new
        @username_array = scrape.remove_self_from_array(twitter_handle)
        @twitter_username_hash = scrape.remove_self_from_hash(twitter_handle)
	end

	def follow_your_classmates
        begin
            twitter.follow(username_array)
            view = FollowEveryone.new
            view.render
        rescue
            view = FollowEveryoneError.new
            view.render
            
        end
        
    end

    def follow_one_classmate
        begin
            view = FollowOneClassmate.new
            view.render
            name = gets.chomp
            twitter_handle = twitter_username_hash[name]
            twitter.follow(twitter_handle)
            puts "You have followed #{twitter_handle}."
        rescue
            view = FollowOneClassmateError.new
            view.render
        end
    end

    def tweet
        view = ChooseAClassmateToTweetAt.new
        view.render
        name = gets.chomp
        twitter_handle = twitter_username_hash[name]
        view = EnterATweet.new
        view.render
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
        begin
            twitter.unfollow(username_array)
            view = UnfollowAllClassmatesSuccess.new
            view.render
        rescue
            view = UnfollowAllClassmatesError.new
            view.render            
        end
    end

    def unfollow_one_classmate
        begin
            view = UnfollowOneClassmate.new
            name = view.render
            twitter_handle = twitter_username_hash[name]
            twitter.unfollow(twitter_handle)
            view = UnfollowOneClassmateSuccess.new(twitter_handle)
            view.render        
        rescue
            view = UnfollowOneClassmateSuccess.new(twitter_handle)
            view.render  
        end
    end
end