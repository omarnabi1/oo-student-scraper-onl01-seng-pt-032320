require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
 

  def self.scrape_index_page(index_url)
     students = [ ]
    
    students_list = Nokogiri::HTML(open(index_url))
    students_list.css('div.student-card').each {|student|
      students << { 
        :name => student.css('p.student-location').text 
        :location => student.css('p')
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

