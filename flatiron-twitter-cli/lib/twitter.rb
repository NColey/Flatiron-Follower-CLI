class TwitterApi
  attr_reader :client

  def initialize
    keys = YAML.load_file('application.yml')
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['CONSUMER_KEY']
      config.consumer_secret     = keys['CONSUMER_SECRET']
      config.access_token        = keys['ACCESS_TOKEN']
      config.access_token_secret = keys['ACCESS_TOKEN_SECRET']
    end
  end

  def follow_all(username_array)
    client.follow(username_array)
  end

  def follow_classmate(username)
    client.follow(username)
  end

  def tweet_at_classmate(tweet, username)
    client.update(tweet)
  end

  def unfollow_all(username_array)
    client.unfollow(username_array)
  end

  def unfollow_classmate(username)
    client.unfollow(username)
  end

  def classmate_timeline(username)
    client.user_timeline(username)
  end

end