require 'pry'
require 'Nokogiri'
require 'open-uri'

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
		get_student_data('div.blog-title h3 a').collect do |name_data|
			"https://learn-co-students.github.io/deploy-on-day-1-web-0915/" + name_data['href']
		end
	end
	
	def twitter_username_array
		student_page_array.each do |page_link|
			noko_document = Nokogiri::HTML(page_link)
			social_media_data = noko_document.css(".social-icons a")
			twitter_username_array << social_media_data.first
		end
		twitter_username_array
	end

	def build_student_hash
		count = 0
		student_name_array.each_with_object({}) do |name, name_hash|
			name_hash[name] = {page: student_page_array[count], twitter_username: twitter_username_array[count]}
			count +=1
		end
	end

