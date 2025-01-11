source "https://rubygems.org"

ruby ">= 3.2.0"

gem "rake", ">= 13.0", require: false

group :development do
  gem "bump", "~> 0.10.0"
  gem "yard", "~> 0.9.34", require: false
end

group :development, :test do
  gem "debug"
  gem "guard-rspec", require: false
  gem "rspec", require: false

  # Linting and style checking
  gem "standard", ">= 1.35.1", require: false

  # Code coverage
  gem "simplecov", require: false

  # Git hooks management
  gem "overcommit"
end

group :test do
  gem "git", require: false
end
