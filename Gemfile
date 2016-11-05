ruby '2.3.1'
source 'https://rubygems.org' do
  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
  gem 'rails', '>= 5.0.0.rc1', '< 5.1'
  gem 'responders'
  # Use postgresql as the database for Active Record
  gem 'pg', '~> 0.18'
  # Use Puma as the app server
  gem 'puma', '~> 3.0'
  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
  gem 'jbuilder', '~> 2.0'
  # Use Redis adapter to run Action Cable in production
  # gem 'redis', '~> 3.0'
  # Use ActiveModel has_secure_password
  # gem 'bcrypt', '~> 3.1.7'

  # Use Capistrano for deployment
  # gem 'capistrano-rails', group: :development

  # Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
  # gem 'rack-cors'

  # Use SCSS for stylesheets
  gem 'sass-rails'

  gem 'react-rails'

  group :development, :test do
    # Call 'byebug' anywhere in the code to stop execution and get a debugger console
    gem 'pry-byebug', platform: :mri
  end

  group :development do
    gem 'listen', '~> 3.0.5'
    # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
    gem 'dotenv-rails'
    gem 'dotenv-heroku'
  end

  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

  gem 'atlassian-jwt-authentication',
    git: 'https://github.com/pawelniewie/atlassian-jwt-authentication.git',
    branch: 'master',
    require: 'atlassian_jwt_authentication'

  # Mail handling
  gem 'mailgun_rails'
  gem 'roadie-rails'
  gem 'nokogiri'
  gem 'shoryuken'

  gem 'haml'
  gem 'slim'

  gem 'attr_encrypted'

  gem 'addressable'

  # LogEntry
  gem 'le'

  gem 'newrelic_rpm'

  gem 'gibbon'

  gem 'rails-commons', github: 'pawelniewie/rails-commons', branch: 'master'
end

