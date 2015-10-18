class TwitterCli
    attr_accessor :quit, :controller

    def call
        @quit = false 
        puts "Welcome to Flatiron Follower!"
        puts "Please enter your Twitter handle."
        twitter_handle = gets.chomp 
        puts "Please wait while we load your information..."
        @controller = Controller.new(twitter_handle)
        options
    end

    def options
        while quit ==false
            puts <<-EOS
            Here are your options:

            1. FOLLOW ALL CLASSMATES
            2. FOLLOW A SINGLE CLASSMATE
            3. TWEET
            4. VIEW
            5. UNFOLLOW ALL CLASSMATES
            6. UNFOLLOW A SINGLE CLASSMATE
            7. Exit
            EOS
            select_option
            sleep(2)
        end
    end

    def select_option
        puts "Please enter a command."
        command = gets.chomp.to_i

        case command
        when 1
            controller.follow_your_classmates
        when 2
            controller.follow_one_classmate
        when 3
            controller.tweet
        when 4
            controller.view_timeline
        when 5
            controller.unfollow_all_classmates
        when 6
            controller.unfollow_one_classmate
        when 7
            puts "Goodbye!"
            exit
        else
            puts "We don't understand that command, please try again"
            select_option
        end
    end

    def exit
        quit = true
        exit
    end

end

