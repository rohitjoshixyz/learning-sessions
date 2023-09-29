# Week 3 .

### Title: Rack Middleware

### Problem statement
Implement a simple rack middleware that does the following
Some kind of statistics middleware:
- count object allocations
- GC runs
- database calls
- http calls

### Comments/Description/Learnings
Rack is [a gem](https://github.com/rack/rack)
It provides an interface for developing web applications in Ruby. By wrapping HTTP requests and responses in the simplest way possible, it unifies and distills the bridge between web servers, web frameworks, and web application into a single method call.

https://ignaciochiazzo.medium.com/rack-middlewares-using-ruby-on-rails-af690b7bc3f8

https://shashwat-creator.medium.com/rack-and-rack-middleware-f93513ac92a6

https://github.com/betacraft/dissecting-rails-workshop/blob/main/exercise_1_rack_middleware


https://gist.github.com/changmason/1280467
```
gem install rack
gem install rackup
```



