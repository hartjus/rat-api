require "sqlite3"

db = SQLite3::Database.new "rodent_activity.sqlite"


db.execute <<-SQL
  create table events (
    date text,
    sensor_id int
  );
SQL

# {
#   "one" => 1,
#   "two" => 2,
# }.each do |pair|
#   db.execute "insert into numbers values ( ?, ? )", pair
# end