require "hanami/api"
require 'date'
require "sqlite3"

class App < Hanami::API

  post "/data" do
    sensor_id = params[:sensor_id]

    # puts "------->"
    # puts @db
    # puts "------->"

    # Error handling can be added here for missing data

    # File.open("json_data/data.json", "a") { |file| file.write(data.to_json + "\n") }

    db = SQLite3::Database.open "rodent_activity.sqlite"

    db.execute "insert into events (sensor_id, date) values ( ?, ? )", sensor_id, DateTime.now.to_s

    json({ message: "OK" }, "application/json")
  end

  get "/data" do
    daysAgo = params[:daysAgo] || 30
    db = SQLite3::Database.open "rodent_activity.sqlite"

    now = DateTime.now
    date = (now - 30).to_s

    results = db.execute "select * from events where date > ? order by date asc", date

    json({results: results}, "application/json")
  end

  get "/ping" do
    "pong"
  end
end