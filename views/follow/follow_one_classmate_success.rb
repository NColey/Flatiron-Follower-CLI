class FollowOneClassmateSuccess
	attr_accessor :twitter_handle

	def initialize(twitter_handle)
		@twitter_handle = twitter_handle
	end

	def render
		puts "You have followed #{twitter_handle}."
	end
end