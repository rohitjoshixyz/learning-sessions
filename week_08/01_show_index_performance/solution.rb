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

# Method to set up the database and table
def setup_database
  CreateUsersTable.migrate(:up)
  # User.delete_all
  populate_users
end

# Method to populate the users table
def populate_users
  100_000.times do |i|
    User.find_or_create_by(name: "User #{i}", email: "user#{i}@example.com")
  end
end

# Method to benchmark the query
def benchmark_query(email_to_find)
  Benchmark.measure { User.find_by(email: email_to_find) }
end

# Method to run the full benchmark with and without index
def run_benchmark
  email_to_find = "user50000@example.com"
  
  # Benchmark without index
  setup_database
  RemoveEmailIndexFromUsers.migrate(:up)
  time_without_index = benchmark_query(email_to_find)
  puts "Time taken without index: #{time_without_index.real} seconds"
  
  # Benchmark with index
  AddEmailIndexToUsers.migrate(:up)
  time_with_index = benchmark_query(email_to_find)
  puts "Time taken with index: #{time_with_index.real} seconds"
end

# Run the benchmark
run_benchmark
