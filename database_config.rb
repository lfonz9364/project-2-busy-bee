require "active_record"

options = {
  adapter: 'postgresql',
  database: 'busy_bee_db',
}

ActiveRecord::Base.establish_connection(options)