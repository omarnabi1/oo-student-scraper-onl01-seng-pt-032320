require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper
 

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    flatiron_students = [ ]
    
    doc.css("div.roster-cards-container").each do |card|
      card.css(".student-card a").each do |student|
        profile_url = "#{student.attr('href')}"
        s_location = student.css('.student-location').text
        name = student.css('.student-name').text
        
        flatiron_students << {:name => name, :location => s_location, :profile_url => profile_url}
     end
     
    end
    flatiron_students
  end
    

  def self.scrape_profile_page(profile_url)
    flatiron_student = Hash.new
    doc = Nokogiri::HTML(open(profile_url))
    
    social_media = doc.css(".social-icon-container").children.css("a").map { |element| element.attr('href')}
      
      
        
        social_media.each do |social|
          if social.include?('twitter')
            flatiron_student[:twitter] =  social
          elsif social.include?('linkedin')
            flatiron_student[:linkedin] = social
          elsif social.include?('github')
            flatiron_student[:github] = social
          else 
            flatiron_student[:blog] = social
          end
        end

        flatiron_student[:profile_quote] = doc.css("div.profile-quote").text
        flatiron_student[:bio] = doc.css("div.bio-content.content-holder div.description-holder p").text if doc.css("div.bio-content.content-holder div.description-holder p").text
     
        
        flatiron_student 
     
     


  end
   
   

end