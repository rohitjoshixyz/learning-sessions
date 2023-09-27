require_relative "database_setup"

class MyMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    [200, {}, ["Modified by MyMiddleware, #{body.first}"]]
  end
end

class DbCallCounter
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    [status, headers,  ["Modified by DBCallCounter, #{body.first}"]]
  end
end

app = lambda do |env|
  [
    200,
    {},
    ["Endpoint app"]
  ]
end

use MyMiddleware
use DbCallCounter
run app
