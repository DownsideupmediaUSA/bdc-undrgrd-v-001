class Mix < ActiveRecord::Base
  belongs_to :artist

def slug
  title.downcase.gsub(" ","-")
end

def self.find_by_slug(slug)
  Mix.all.find{|mix| mix.slug == slug}
end 

end