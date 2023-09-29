require "active_record"
require "csv"

class CreateUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |table|
      table.string :name
      table.string :email
      table.timestamps
    end

    add_index :users, :email, unique: true, if_not_exists: true
  end
end
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: "db.sqlite3"
Arel::Table.engine = ActiveRecord::Base
CreateUsersTable.migrate :up

class User < ActiveRecord::Base
end

CSV.read("users.csv", headers: true).each do |row|
  User.find_or_create_by!(
    name: "#{row["first_name"]} #{row["last_name"]}",
    email: row["email"]
  )
end
