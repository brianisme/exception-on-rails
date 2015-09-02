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
