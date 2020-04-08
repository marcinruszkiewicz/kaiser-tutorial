# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
require 'kaiser_tutorial'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def file_fixture(fixture_name)
  file_fixture_path = File.dirname __FILE__
  path = Pathname.new(File.join(file_fixture_path, 'fixtures', fixture_name))

  if path.exist?
    path
  else
    msg = "the directory '%s' does not contain a file named '%s'"
    raise ArgumentError, format(msg, file_fixture_path, fixture_name)
  end
end
