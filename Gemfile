source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.1'
gem 'mysql2'

gem 'uglifier', '>= 1.3.0'
gem "mail-iso-2022-jp", '~> 2.0.0'
gem 'slack-api'

# Asset related gems
gem 'jquery-rails'
gem 'sass-rails', '~> 5.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'json', '~> 1.8.2'

# Misc.
gem 'bcrypt', '~> 3.1.10'

group :development, :test do
  gem 'annotate', '~> 2.6.10'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'capistrano', '~> 3.4.0', require: false
  gem 'capistrano-rails', '~> 1.1.3', require: false
  gem 'capistrano-bundler', '~> 1.1.4', require: false
  gem 'capistrano-maintenance', github: 'capistrano/maintenance', require: false
  gem 'capistrano3-unicorn', '~> 0.2.1', require: false
end

# TODO test gems

group :production do
  gem 'pg'
  gem 'rails_12factor'
end