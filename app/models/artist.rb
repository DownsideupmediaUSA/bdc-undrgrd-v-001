class Artist < ActiveRecord::Base
  has_many :tracks
  has_many :mixes

has_secure_password

def slug
  username.downcase.gsub(" ","-")
end

def self.find_by_slug(slug)
  Artist.all.find{|artist| artist.slug == slug}
end 


end