class SuccessfulTweetMessage
	attr_accessor :twitter_handle

	def initialize(twitter_handle)
		@twitter_handle = twitter_handle
	end

	def render
        puts "You have tweeted at #{twitter_handle}!"
	end
end