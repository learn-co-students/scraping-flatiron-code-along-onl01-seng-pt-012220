class Course

attr_accessor :title, :schedule, :description #getter and setters

#set this for class method tests
@@all = []

def initialize 
    @@all << self
end

def self.all
    @@all
end

def self.reset_all
    @@all.clear
end
#get_page
end

