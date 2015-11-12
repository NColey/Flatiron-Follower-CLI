class Scraper
	attr_accessor :url 

	def initialize
		@url = "https://learn-co-students.github.io/deploy-on-day-1-web-0915/"
	end

	def noko_data
		noko_document = Nokogiri::HTML(open(url))
	end

	def get_student_data(selector)
		noko_data.css(selector)
	end

	def student_name_array
		get_student_data('div.blog-title h3 a').collect {|name_data| name_data.text}
	end

		
	def student_page_array
		students_name_array = get_student_data('div.blog-title h3 a').collect do |name_data|
			"https://learn-co-students.github.io/deploy-on-day-1-web-0915/" + name_data['href']
		end
		
		#cleans out the broken links
		students_name_array.reject do |link|
	    link == "https://learn-co-students.github.io/deploy-on-day-1-web-0915/students/student_name.html"
	  end
	  
	end

	def student_twitter_hash
		student_page_array.each_with_object({}) do |link, hash|
	    profile_html = open(link)
	    profile_doc = Nokogiri::HTML(profile_html)
	    name = profile_doc.search('.ib_main_header').text
	    twitter = profile_doc.search('.social-icons a')[0].attr('href') 
	    hash[name] = twitter 
		end
		#there are a couple people without correct names.
	end

	def hash_twitter
	  hash = student_twitter_hash.reject{|name, url| url =="https://twitter.com/"}
	  hash_cleansed = hash.delete_if do |name, link|
	  	name == "" || name == "Student Name"
	  end
	  #add them back in
	  hash_cleansed["Madeline Ford"] = "https://twitter.com/mford22392"
	  hash_cleansed["Michael Sterling"] = "https://twitter.com/sterlinglit"
	  hash_cleansed["Amanda Johns"] = "https://twitter.com/AmandaKJohns"
	  hash_cleansed
	end

	def username_array
		array_of_handles = hash_twitter.values.reject{|url| url == "https://twitter.com/"}.map{|url| url[20..-1]}
	end

	def twitter_username_hash
		username_hash = hash_twitter
		username_hash.inject({}) {|hash, (name, twitter_link)| hash[name] = twitter_link.slice! "https://twitter.com/"; hash}
		return username_hash
	end

	def remove_self_from_array(twitter_handle)
		username_array.reject {|username| username == twitter_handle}
	end

	def remove_self_from_hash(twitter_handle)
		twitter_username_hash.reject {|name, handle| handle == twitter_handle}
	end



















end