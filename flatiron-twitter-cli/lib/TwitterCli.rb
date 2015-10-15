class TwitterCli
    attr_accessor :scraper, :twitter

    def call
        puts "Welcome to Flatiron Follower!"

        puts "Please enter your Twitter handle."
        twitter_handle = gets.chomp 
        options
    end

    def options
        puts <<-EOS
        Here are your options:

        1. FOLLOW ALL CLASSMATES
        2. FOLLOW A SINGLE CLASSMATE
        3. TWEET
        4. VIEW
        5. UNFOLLOW ALL CLASSMATES
        6. UNFOLLOW A SINGLE CLASSMATE
        EOS
        select_option
    end

    def select_option
        puts "Please enter a command."
        command = gets.chomp.to_i
        @scrape = Scraper.new
        @twitter = TwitterApi.new

        case command
        when 1
            follow_your_classmates
        when 2
            follow_one_classmate
        when 3
            tweet
        when 4
            view_timeline
        when 5
            unfollow_all_classmates
        when 6
            unfollow_one_classmate
        end
    end

    def follow_your_classmates
        username_array = scrape.username_array
        twitter.follow(username_array)
        puts "You have followed everyone."

    end

    def follow_one_classmate
        puts "Please enter the name of the classmate you want to follow."
        name = gets.chomp.downcase
        #convert to twitter handle
        twitter.follow(twitter_handle)
        puts "You have followed #{twitter_handle}."
    end

    def tweet
        puts "Please enter the name of the classmate you want to tweet at."
        name = gets.chomp.downcase
        #convert to twitter handle
        puts "Please enter your tweet"
        message = gets.chomp
        tweet = "@#{twitter_handle} #{message}"
        twitter.tweet_at_classmate(tweet)
    end

    def view_timeline
        puts "Whose tweets would you like to view? Enter a classmates name."
        name = gets.chomp
        #convert name to twitter handle
        twitter.classmate_timeline(twitter_handle)
    end

    def unfollow_all_classmates
        username_array = scrape.username_array
        twitter.unfollow(username_array)
        puts "You've unfollowed everyone."
    end

    def unfollow_one_classmate
        puts "Please enter the name of the classmate you want to unfollow."
        name = gets.chomp.downcase
        #convert to twitter handle
        twitter.unfollow(twitter_handle)
    end

end

