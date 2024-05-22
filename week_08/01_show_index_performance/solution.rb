require 'active_record'
require 'benchmark'
require 'sqlite3'

# Establish database connection
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "db.sqlite3")
Arel::Table.engine = ActiveRecord::Base

# Define the User model
class User < ActiveRecord::Base ; end

# Create the users table migration
class CreateUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |table|
      table.string :name
      table.string :email
      table.timestamps
    end
  end
end

# Create the email index migration
class AddEmailIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email, if_not_exists: true
  end
end

# Drop the email index migration
class RemoveEmailIndexFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :email, if_exists: true
  end
end

# Create the created_at index migration
class AddCreatedAtIndexToUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :created_at, if_not_exists: true
  end
end

# Drop the created_at index migration
class RemoveCreatedAtIndexFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_index :users, :created_at, if_exists: true
  end
end

# Method to set up the database and table
def setup_database
  CreateUsersTable.migrate(:up)
  # User.delete_all
  populate_users
end

# Method to populate the users table
def populate_users
  start_time = Time.now - 100_000 # Start 100,000 seconds ago
  100_000.times do |i|
    User.create(name: "User #{i}", email: "user#{i}@example.com", created_at: start_time + i)
  end
end

# Method to benchmark the query
def benchmark_query(description, &block)
  time = Benchmark.measure(&block)
  puts "#{description}: #{time.real} seconds"
end

# Method to run the full benchmark with and without index
def run_benchmark
  setup_database
  RemoveEmailIndexFromUsers.migrate(:up)
  RemoveCreatedAtIndexFromUsers.migrate(:up)
  start_time = Time.now - 50_000
  end_time = Time.now - 10_000
  time_range = start_time..end_time

  # Benchmark without index
  benchmark_query("Time taken to search by email without index") do
    User.find_by(email: "user50000@example.com")
  end

  benchmark_query("Time taken to sort by created_at without index") do
    User.order(:created_at).limit(10).to_a
  end

  benchmark_query("Time taken to filter by created_at range without index") do
    User.where(created_at: time_range).to_a
  end

  email_like_pattern = "user50%"
  benchmark_query("Time taken to search by email LIKE pattern without index") do
    User.where("email LIKE ?", email_like_pattern).to_a
  end

  # Benchmark with index
  AddEmailIndexToUsers.migrate(:up)
  AddCreatedAtIndexToUsers.migrate(:up)

  benchmark_query("Time taken to search by email with index") do
    User.find_by(email: "user50000@example.com")
  end

  benchmark_query("Time taken to sort by created_at with index") do
    User.order(:created_at).limit(10).to_a
  end

  benchmark_query("Time taken to filter by created_at range with index") do
    User.where(created_at: time_range).to_a
  end

  benchmark_query("Time taken to search by email LIKE pattern with index") do
    User.where("email LIKE ?", email_like_pattern).to_a
  end
end

# Run the benchmark
run_benchmark

# Time taken to search by email without index: 0.007096000015735626 seconds
# Time taken to sort by created_at without index: 0.020409999880939722 seconds
# Time taken to filter by created_at range without index: 0.3861490001436323 seconds
# Time taken to search by email LIKE pattern without index: 0.05426400015130639 seconds

# Time taken to search by email with index: 0.000250999815762043 seconds
# Time taken to sort by created_at with index: 0.00022300006821751595 seconds
# Time taken to filter by created_at range with index: 0.3732010000385344 seconds
# Time taken to search by email LIKE pattern with index: 0.034749999875202775 seconds
