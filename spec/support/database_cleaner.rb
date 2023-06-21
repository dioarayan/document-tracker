RSpec.configure do |config|
  config.around do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
