# frozen_string_literal: true
require "bundler/setup"
require "hanami/api"
require "hanami/middleware/body_parser"

require_relative "app"

use Hanami::Middleware::BodyParser, :json

# Sqlite
# db = SQLite3::Database.open "test.sqlite"

# db.execute <<-SQL
#   create table numbers (
#     name varchar(30),
#     val int
#   );
# SQL

# Execute a few inserts
# {
#   "one" => 1,
#   "two" => 2,
# }.each do |pair|
#   db.execute "insert into numbers values ( ?, ? )", pair
# end

# App definition goes here (app.rb)
run App.new
