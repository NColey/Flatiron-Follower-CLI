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

  def follow(username)
    client.follow!(username)
  end

  def tweet_at_classmate(tweet)
    client.update(tweet)
  end

  def unfollow(username)
    client.unfollow(username)
  end

  def classmate_timeline(username)
    timeline_array = client.user_timeline(username)
    timeline_array.map do |tweet|
      puts tweet.text
    end
  end

end