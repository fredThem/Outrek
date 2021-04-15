require "open-uri"
#
require_relative "seeds/seed_model_resets"
require_relative "seeds/seed_users"




seed_model_resets # reset all db

seed_users

# binding.pry
puts "Hello"