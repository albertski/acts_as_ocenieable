require "bundler/setup"
require "sqlite3"
require "active_record"
require "acts_as_ocenieable"
require "database/schema"
require "factory_bot"

$:.unshift(File.join(File.dirname(__FILE__), 'models'))

Dir["./spec/models/*.rb"].sort.each { |f| require f }
Dir["./spec/factories/*.rb"].sort.each { |f| require f }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include FactoryBot::Syntax::Methods
end
