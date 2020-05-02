require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
 

  def self.scrape_index_page(index_url)
     students = [ ]
    
    students_list = Nokogiri::HTML(open(index_url))
    students_list.css('div.student-card').each {|student|
      students << { 
        :name => student.css('h4.student-name').text, 
        :location => student.css('p.student-location').text,
        :profile_url => "./fixtures/student-site/" + student.css('a').first.attr('href')
      }
    }
    students
  end
    

  def self.scrape_profile_page(profile_url)
    profile_data = {}
    
    student_page = N
    
  end

end

