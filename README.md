# exception-on-rails

Install
-----------
- `git clone git@github.com:brianisme/exception-on-rails.git`
- `cd expception-on-rails`
- `bundle install`
- `rake db:create:all`
- `rake db:migrate db=development`
- `RAILS_ENV=production rake db:migrate`

Start the server
-----------
`rails s`

Invoke exceptions
-----------
- GET http://localhost:3000/exception returns 404 ActiveRecord::RecordNotFound
- POST http://localhost:3000/exception returns 422 ActiveRecord::RecordInvalid

References
-----------
#####Rails-wise
https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/show_exceptions.rb#L49
https://github.com/rails/rails/blob/master/actionpack/lib/action_dispatch/middleware/debug_exceptions.rb#L63

#####Stuffs floating in internet
http://honeyco.nyc/blog/custom-rails-exception-pages/
http://geekmonkey.org/2012/10/exception-applications-in-rails-3-2/
https://github.com/taiki45/debug_exceptions_json/blob/master/lib/debug_exceptions_json.rb
