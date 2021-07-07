require 'nokogiri'
require 'open-uri'
require "pry"

require_relative './course.rb'

class Scraper
  attr_accessor :doc, :courses

  def initialize
    @doc = get_page
    @courses = []
  end
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end

  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    Nokogiri::HTML(html)
  end

  def get_courses
    @doc.css(".posts-holder")
  end

  def make_courses
    all_data = get_courses
    all_data.css("article").each do
       mk_course = Course.new
       mk_course.title = all_data.css("h2").text
       mk_course.schedule = all_data.css("em").text
       mk_course.description = all_data.css("p").text
    end
  end


end
