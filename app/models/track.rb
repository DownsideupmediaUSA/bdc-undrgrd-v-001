class Track < ActiveRecord::Base
belongs_to :User

# def slug
#   self.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
# end

# def self.find_by_slug(slug)
#   Track.all.find{|track| track.slug == slug}
# end 
end