require 'pry'
require 'Nokogiri'
require 'open-uri'

class Scraper

	def noko_data
		noko_document = Nokogiri::HTML(open("https://learn-co-students.github.io/deploy-on-day-1-web-0915/"))
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

	hash_twitter_only = student_twitter_hash.reject{|name, url| url =="https://twitter.com/"}

	def username_array
		array_of_handles = student_twitter_hash.values.reject{|url| url == "https://twitter.com/"}.map{|url| url[20..-1]}
	end
end
