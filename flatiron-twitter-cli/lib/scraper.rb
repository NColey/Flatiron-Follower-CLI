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

	def get_student_page_links
		get_student_data('div.blog-title h3 a').collect do |name_data|
			"https://learn-co-students.github.io/deploy-on-day-1-web-0915/" + name_data['href']
		end
	end
	
	def get_student_twitter_username
		get_student_data('div.blog-title h3 a').each do |student_name|
			student_noko_doc(student_name).css(".social-icons a")
		end
	end

	def build_student_hash
		count = 0
		student_name_array.each_with_object({}) do |name, name_hash|
			name_hash[name] = {page: get_student_page_links[count], twitter_username: get_student_twitter_username[count]}
			count +=1
		end
	end

