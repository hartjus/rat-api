require "sqlite3"
require "singleton"

class DB
    include Singleton
    @instance = SQLite3::Database.open "rodent_activity.sqlite"
end