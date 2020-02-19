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
    @doc.css(".posts-holder").h2
    binding.pry
  end

end
