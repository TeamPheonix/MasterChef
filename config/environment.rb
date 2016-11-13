# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails::Initializer.run do |config|
  # ...
  config.active_record.observers = :user_observer
end
