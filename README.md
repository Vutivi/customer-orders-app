# customer-orders-app

This app consumes big data from https://github.com/jpwhite3/northwind-SQLite3 and present it in an interactive manner. This was my first Ruby on Rails APP and was part of my interview at Zero one bespoke software. I was allowed to use any language but opted to learn Rails as I was interviewing for a RoR role. It was a great project that began my career in Ruby on Rails development and I'm still grateful to the guys at Zero one for investing in my potential and my abilities to be productive.

Challenges faced:

* I had to host the app on Heroku and therefore needed to learn moving of data from sqlite3 to Postgres
* Precompiling of scripts - I used chartkick for my graphs and it was working correctly in development and not in production

Configuration

* git clone git@github.com:Vutivi/customer-orders-app.git
* cd customer-orders-app
* bundle
* rake db:create
* rake db:migrate
* rails s

The app is available on heroku on the following link: https://customer-metrics-app.herokuapp.com/
* login details are user: admin and password: secret
