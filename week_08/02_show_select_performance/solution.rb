require 'benchmark'
require 'active_record'
require 'sqlite3'

# Setup connection to the database
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db.sqlite3'
)
Arel::Table.engine = ActiveRecord::Base

# Create the orders table migration
class CreateOrdersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, if_not_exists: true do |t|
      t.integer :user_id
      t.decimal :total_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end

CreateOrdersTable.migrate(:up)

# Define the Order model
class Order < ActiveRecord::Base
end

Order.delete_all

100_000.times do |i|
  Order.create(
    user_id: rand(1..10),
    total_price: rand(1.0..500.0).round(2)
  )
end

# Create a method to benchmark without `select`
def benchmark_without_select(user_ids)
  orders = Order.where(user_id: user_ids)
  total_value = orders.sum(&:total_price)
  average_value = total_value / orders.size.to_f
  average_value
end

# Create a method to benchmark with `select`
def benchmark_with_select(user_ids)
  order_values = Order.where(user_id: user_ids).select(:total_price)
  total_value = order_values.sum(&:total_price)
  average_value = total_value / order_values.size.to_f
  average_value
end

def benchmark_query(description, &block)
  time = Benchmark.measure(&block)
  puts "#{description}: #{time.real} seconds"
end

# Benchmark the performance
user_ids = (1..10).to_a

benchmark_query("Without select") { benchmark_without_select(user_ids) }
benchmark_query("With select") { benchmark_with_select(user_ids) }
