source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
group :development, :test do
  gem 'sqlite3'
  # Deploy with Capistrano
  gem 'capistrano'
  gem 'rvm-capistrano'
end

group :production do
  gem 'unicorn'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'angularjs-rails'

end
gem 'coffee-rails', '~> 3.2.1'
#gem 'sass-rails',   '~> 3.2.3'
gem 'uglifier', '>= 1.0.3'
gem "therubyracer"
gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

gem 'will_paginate'



# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'



# To use debugger
# gem 'debugger'

# Refinery CMS
gem 'refinerycms', '~> 2.1.0'

# Optionally, specify additional Refinery CMS Extensions here:

gem 'refinerycms-acts-as-indexed', '~> 1.0.0'
#  gem 'refinerycms-blog', '~> 2.1.0'
#  gem 'refinerycms-inquiries', '~> 2.1.0'
  gem 'refinerycms-search', '~> 2.1.0.dev' #, :git => 'git@github.com:refinery/refinerycms-search.git'
#  gem 'refinerycms-page-images', '~> 2.1.0'

gem 'refinerycms-films', :path => 'vendor/extensions'
gem 'friendly_id'
gem 'stringex'
gem 'fastimage'