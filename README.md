# Flatiron-Student-Follower

Welcome to Flatiron Student Follower. This is a command line application that allows Flatiron School students in the Web 0915 class to follow their classmates on Twitter. 

By scraping the Flatiron School [students page](https://learn-co-students.github.io/deploy-on-day-1-web-0915/) for our class we gathered the twitter handles for our classmates and sorted them into a hash, which, along with the Twitter API, we used to create methods that would allow us to follow our classmates, send them tweets, and unfollow our classmtes, all within a command line application!

##Using Our Command Line App

We hope that this command line application can be used by fellow Web 0915 students to follow and tweet at their classmates. We currently do not yet have options for authentication so if you would like to use this program we encourage you to set up your own twitter keys (instructions below), fork our repository and then add an application.yml file that contains the twitter keys you just created. Here is the file structure of our program so you can see where to place the application.yml file:

```bash
├── bin
|	└── console.rb
│   └── run
|── config
│   └── environment.rb
|__ controllers
|   └── application_controller.rb
├── lib
│   └── scraper.rb
|   └── twitter.rb
|   └── TwitterCli.rb
|
├── views
|   └── follow
|   |	└── follow_everyone.rb
|   |	└── follow_everyone_error.rb
|   |	└── follow_one_classmate.rb
|   |	└── follow_one_classmate_error.rb
|   |	└── follow_one_classmate_sucess.rb
|   ├── tweet
|   |	└── choose_a_classmate_to_tweet.rb
|   |	└── enter_a_tweet.rb
|   |	└── successful_tweet_message.rb
|   └── unfollow
|   |	└── unfollow_all_classmates.rb
|   |	└── unfollow_all_classmates_error.rb
|   |	└── unfollow_one_classmate.rb
|   |	└── unfollow_one_classmate_success.rb
|   └── view_timeline
|    	└── view_student_timeline.rb
├── .gitignore
├── application.yml
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
```

### Getting Your API Keys

If you don't have a Twitter account make sure to sign up for one first. Create a new application on Twitter in order to obtain the API keys you will need to use this application. You can get your API keys at [Twitter Apps](https://apps.twitter.com/). Head to the the `API Keys` section of your application page, scroll down, and click on the "generate access token" option to get your consumer token, consumer secret, access token, and acess token secret.

Fork our program, and then create an `application.yml` file in the root directory of just as it is in the file structure displayed above. Add your Twitter keys to that file in this format:

ACCESS_TOKEN: Your token here
ACCESS_TOKEN_SECRET: Your token secret here
CONSUMER_KEY: Your key here
CONSUMER_SECRET: Your consumer secret here.

Save the file and then open the program in your terminal and run it using `ruby bin/run`

Enjoy!