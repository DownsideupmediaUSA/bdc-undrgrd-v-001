class Track < ActiveRecord::Base
belongs_to :User

def slug
  title.downcase.gsub(" ","-")
end

def self.find_by_slug(slug)
  Track.all.find{|track| track.slug == slug}
end 
end