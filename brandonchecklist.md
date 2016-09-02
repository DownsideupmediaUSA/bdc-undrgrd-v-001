Brandon's development checklist

I. Build out file structure/scaffold
   A.controller
    1.User -x
    2.Mixes -x
    3.Tracks -x
     
   B.models
    1.User 
      a)has many mixes -x
      b)has many tracks  -x
    2.Tracks 
      a)belong to a user  -x
    3.Mixes
      a)belong to a user    -x  
   C.views
    1.User  
     a)create user -x
     b)show -x
     c)login       -x
    
    2.Tracks 
     a)edit -x
     b)new_track -x
     c)show_track -x
     d)tracks -x

    3.Mixes 
     a)edit -x
     b)new_mix-x
     c)show_mix -x
     d)mixes -x

    3.Index -x
    4.Layout -x

*****SAVE YOUR PROGRESS PLEASE THANK YYYYYOUUUU*****

II. Create Tables
    A.CreateUser 
     1.username -x
     2.email    -x
     3.password_digest -x
     
    B.CreateTracks 
     1.title   -x
     2.content(mp3) -x
     3.user id -x

    C.CreateMixes
     1.title   -x
     2.content(mp3) -x
     3.user id  -x

****TEST OUT YOUR DATABASE PRIOR TO SAVING HERE *****
*****SAVE YOUR PROGRESS PLEASE THANK YYYYYOUUUU*****

III. Migrate! -x

*****SAVE YOUR PROGRESS PLEASE THANK YYYYYOUUUU*****

IV. Build out Controller Routes

    A.User
      1.create_user (signup_)
        a)gets create_user form and sends to user -x
        b)posts completed form & redirects to user/index page -x
        c)logout ends session and sends user back to login page -x
        
      2.index -  
        a)Welcomes signed in user  -x
        b)link to allow user to view all tracks -x
        c)link to allow user to view all mixes -x
      3.login
        a)gets login form  -x
        b)if valid user redirects to index -x
      4.show
        a)shows data(content) of new tracks -x
        b)shows edited data(content) of a selected tracks.-x
    A.Tracks
     1.edit  
      a)gets edit form and sends to user -x
      b)allows user to delete from indexed tracks -x
      c)posts changed form & redirects to show page -x
     2.index - gets list of tracks
      a)lists index of tracks for user and sends back to index erb -x
      b)link to allow user to write a new tracks -x
     3.new
      a)gets new tracks form via new.erb -x
      b)posts new data(content) and redirects to trackss/new erb  
     4.show
      a)shows data(content) of new tracks -x
      b)shows edited data(content) of a selected tracks. -x

    A.Mixes
     1.edit 
      a)gets edit form and sends to user
      b)allows user to delete from indexed Mixes
      c)posts changed form & redirects to show page
     2.index - gets list of Mixes
      a)lists index of Mixes for user and sends back to index erb
      b)link to allow user to write a new Mixes
     3.new
      a)gets new Mixes form via new.erb
      b)posts new data(content) and redirects to Mixes/new erb
     4.show
      a)shows data(content) of new Mixes
      b)shows edited data(content) of a selected Mixes.

 V. Build out Views
     A.Index
       1.provide links to login and sign up pages
     
     B.Tracks
       1. edit tracks - puts out form to edit a new user  
         a) sends to users/:id/edit.erb  
       2. trackss - displays user data   
         a) sends to index erb          
       3. new tracks - displays form to create new user  
         a)displays form for new tracks  
         b)posts content  
       4. show trackss-  displays data from new user form.  
         a)sends to /user/tracks/:id e (?)

     C.Mixes
       1. edit Mixes - puts out form to edit a new user  
         a) sends to users/:id/edit.erb  
       2. Mixes - displays user data   
         a) sends to index erb          
       3. new Mixes - displays form to create new user  
         a)displays form for new Mixes  
         b)posts content  
       4. show Mixess-  displays data from new user form.  
         a)sends to /user/Mixes/:id e (?)  

      C.User
       1.Create User 
         a)get a form for user to fill  
         b)send that data via post to create new user
       2.Login
         a)display form to log in  
         b)if login correct send via post to users index page ?

         


