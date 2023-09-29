require_relative "database_setup"
require "active_support"

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
    count = 0
    callback = ->(name, start, finish, id, payload) do
      if payload[:name].start_with?("User")
        count += 1
      end
    end
    ActiveSupport::Notifications.subscribe("sql.active_record", callback)
    _, _, body = @app.call(env)

    [200, {},  ["Modified by DBCallCounter - Query count: #{count}, #{body.first}"]]
  end
end

app = lambda do |env|
  User.all.to_a
  User.first.name
  User.last.name
  john = User.create(name: "John Doe", email: "john@circle.co")
  john.update(name: "John Doe Jr.")
  john.destroy
  [
    200,
    {},
    ["Endpoint app"]
  ]
end

map "/db_call_counter" do
  run DbCallCounter.new(app)
end

use MyMiddleware
use DbCallCounter
run app
