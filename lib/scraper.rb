require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
 

  def self.scrape_index_page(index_url)
     students = [ ]
    
    doc = Nokogiri::HTML(open(index_url))
      
      doc.css("div.roster-cards-container").each do |card|
        card.css("student-card a").each do |student|
          
        :name => student.css('h4.student-name').text, 
        :location => student.css('p.student-location').text,
        :profile_url => "./fixtures/student-site/" + student.css('a').first.attr('href')
      }
    }
    students
  end
    

  def self.scrape_profile_page(profile_url)
    profile_data = {}
    
    student_page = Nokogiri::HTML(open(profile_url))
    
    social_media = doc.css(".social-icon-container")
    
  end

end

