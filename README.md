# bdc-undrgrd-v-001
Sinatra CRUD application Featuring original music and mixes


## Objectives

1. Build out a full scale Sinatra application that uses:

+ A sqlite database
+ ActiveRecord
+ RESTful routes
+ Sessions
+ Login/Logout

...and has the following requirements:

- Build an MVC Sinatra Application.
- Use ActiveRecord with Sinatra.
- Use Multiple Models.
- Use at least one has_many relationship
- Must have user accounts. The user that created a given piece of content should be the only person who can     modify that content
- You should validate user input to ensure that bad data isn't created


This sinatra application will allow registered users add and or access original music as well as mixes.


File Structure:

├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   └── application_controller.rb
│   │   └── artists_controller.rb
│   │   └── tracks_controller.rb
│   │   └── mixes_controller.rb
│   │   └── sessions_controller.rb
│   ├── models
│   │   ├── tracks.rb
│   │   ├── mixes.rb
│   │   └── user.rb
│   └── views
│       ├── index.erb
│       ├── layout.erb
│       ├── tracks 
│       │   ├── create_track.erb
│       │   ├── edit_track.erb
│       │   ├── show_track.erb
│       │   └── tracks.erb
│       ├── mixes 
│       │   ├── create_mixes.erb
│       │   ├── edit_mixes.erb
│       │   ├── show_mixes.erb
│       │   └── mixes.erb
│       └── artists
│           ├── create_artist.erb
│           ├── artists.erb
│           ├── login.erb
│           ├── show.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 20151124191332_create_tracks.rb
│   │   ├── 20151124191332_create_artists.rb
│   │   ├── 20151124191332_create_mixes.rb
│   │   ├── 20151124191332_add_artists_to_tracks.rb
│   │   ├── 20151124191332_add_rename_user_table.rb
│   │   ├── 20151124191332_add_rename_user_column.rb
│   │   ├── 20151124191332_remove_user_column.rb
│   │   ├── 20151124191332_remove_user_in_mixes.rb
│   │   ├── 20151124191332_add_artists_id_to_mixes.rb
│   │   ├── 20151124191332_add_artists_name_to_mixes.rb
│   │   ├── 20151124191332_add_artists_name_to_tracks.rb
│   │   ├── 20151124191332_add_artists_name_to_artists.rb
│   │   ├── 20151124191332_add_artists_name_to_artists.rb
│   │   ├── 20151124191332_remove_artists_name_in_mixes.rb
│   │   ├── 20151124191332_remove_artists_name_in_tracks.rb
│   ├── schema.rb
│   └── test.sqlite 