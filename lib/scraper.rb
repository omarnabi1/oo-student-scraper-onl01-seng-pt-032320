require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
 

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    flatiron_students = [ ]
    doc.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        profile_link = "#{student.attr('href')}"
        s_location = student.css('.student-location').text
        name = student.css('.student-name').text
        flatiron_students << {:name => name, :location => s_location, :profile_url => profile_link}
     end
    end
    flatiron_students
  end
    

  def self.scrape_profile_page(profile_url)
    profile_data = {}
    
    student_page = Nokogiri::HTML(open(profile_url))
    
    social_media = doc.css(".social-icon-container")
    
  end

end

