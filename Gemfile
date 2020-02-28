source 'https://code.stripe.com'
source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.2.2'
gem 'cancancan', '~> 2.0'
gem 'puma', '~> 3.12'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'omniauth-stripe-connect'
gem 'cocoon'
gem 'has_scope'
gem 'simple_form'
gem 'country_select', '~> 3.1'
gem 'kaminari'
gem 'activeadmin'
gem 'sendgrid-ruby'
# gem "letter_opener", :group => :development
# gem 'effective_obfuscation'
gem 'activestorage-validator'
gem "puma_worker_killer"
gem "socialization"
gem 'gon'
gem "figaro"
gem 'emoji'
gem "devise", ">= 4.7.1"
gem "mini_magick"
# gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'
# gem 'bootstrap', '~> 4.0.0'
gem "stripe", '~> 4.7.0'
# gem 'paperclip', :git=> 'https://github.com/thoughtbot/paperclip', :ref => '523bd46c768226893f23889079a7aa9c73b57d68'
# gem 'aws-sdk'
gem 'aws-sdk-s3', require: false

group :production do 

  gem 'pg', '~> 0.18.3'

  gem 'rails_12factor'

end

group :development, :test do

  gem 'sqlite3', '~> 1.3.6'

end



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
