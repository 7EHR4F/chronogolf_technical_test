#!/bin/sh
kill `pidof ruby`
bundle update
RAILS_ENV=development rake db:migrate
RAILS_ENV=development rails s -d
