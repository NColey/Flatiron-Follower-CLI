class TwitterCli
  attr_accessor :scrape, :twitter
  def call
    puts "Welcome to Flatiron Follower!"
    puts "Please enter your Twitter handle."
    twitter_handle = gets.chomp 
    
    puts <<-EOS
    Here are your options:

    1. FOLLOW
    2. TWEET
    3. VIEW
    4. UNFOLLOW
    EOS

    puts "Please enter a command."
    command = gets.chomp.to_i
    @scrape = Scraper.new
    @twitter = TwitterApi.new
    case command
      when 1
        array = scrape.username_array
        twitter.follow_all(array)
        puts "You have followed everyone."
        #for individual case  twitter.follow_classmate(name)
      when 2
        puts "Who would you like to tweet?"
        name = gets.chomp
        handle = handle_name #convert the name to handle 
        puts "What would you like to say?"
        message = gets.chomp 
        message_student = "@{#{handle} {message}"
        tweet.tweet_at_classmate(handle, message)       
      when 3
        puts "Whose tweets would you like to view?"
        name = gets.chomp
        handle = handle_name #convert the name to handle
        twitter.classmate_timeline(username)
      when 4
        array = scrape.username_array
        twitter.unfollow_all(array)
        puts "You've unfollowed everyone."
    end

  end

end

