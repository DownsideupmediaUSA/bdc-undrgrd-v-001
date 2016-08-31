class LibraryParser
  def files
    data_path = File.join(File.dirname(__FILE__), '..', 'db', 'data')
    Dir.entries(data_path)[2..-1]
  end

  def self.parse
    self.new.call
  end

  def parse_filename(filename)
    user_match = filename.match(/^(.*) -/)
    track_match   = filename.match(/- (.*) \[/)
     

    artist = artist_match && artist_match[1]
    track   = track_match   && track_match[1]
     

    [user, track]
  end

  def call
    files.each do |filename|
      parts = parse_filename(filename)
      build_objects(*parts)
    end
  end

  def build_objects(user_name, track_name)
    track = Track.create(name: track_name)
    user = User.find_or_create_by(name: username)
    track.user = user
    
    track.save
  end
end