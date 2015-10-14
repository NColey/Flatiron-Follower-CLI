require 'pry'
require 'Nokogiri'
require 'open-uri'

def noko_data
	noko_document = Nokogiri::HTML(open("https://learn-co-students.github.io/deploy-on-day-1-web-0915/"))
end

def get_student_data(selector)
	students_data_array = noko_data.css(selector)
end

def build_student_name_array
	students_name_array = get_student_data('div.blog-title h3 a').collect {|name_data| name_data.text}
end

def build_student_page_links
	students_name_array = get_student_data('div.blog-title h3 a').collect do |name_data|
		"https://learn-co-students.github.io/deploy-on-day-1-web-0915/" + name_data['href']
	end

	students_name_array.reject do |link|
    link == "https://learn-co-students.github.io/deploy-on-day-1-web-0915/students/student_name.html"
  end
  #cleans out the broken links
end

def student_twitter_hash
	build_student_page_links.each_with_object({}) do |link, hash|
    profile_html = open(link)
    profile_doc = Nokogiri::HTML(profile_html)
    name = profile_doc.search('.ib_main_header').text
    twitter = profile_doc.search('.social-icons a')[0].attr('href') 
    hash[name] = twitter 
	end
	#there are a couple people without correct names.
end

# def build_student_hash
# 	count = 0
# 	build_student_name_array.each_with_object({}) do |name, name_hash|
# 		name_hash[name] = {page: get_student_profile_links[count], twitter_username: get_student_twitter_username[count]}
# 		count +=1
# 	end
end
