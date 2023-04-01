# Ecommerce API Ruby 3.1.2 Rails 7 - This api is for didactic purposes

## Install Dependencies

- Distros Debian based

```bash
sudo apt install libssl-dev
```

- Distros RedHat based

```bash
yum install openssl-devel
```

## start project with flag -T to skip minitest

```bash
rails new ecommerce-api --api -d mysql -T
```

## install and config mailcatcher then test it - _config/environments/development.rb_

```ruby
gem install mailcatcher

config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = { address: 'localhost', port: 1025 }
```

## Customize your reset password

- pre visualize your email page

```bash
mkdir -p test/mailers/previews/devise

cat << EOF >> test/mailers/previews/devise/mailer_preview.rb
  class Devise::MailerPreview < ActionMailer::Preview
    def reset_password_instructions
      Devise::Mailer.reset_password_instructions(User.first, {})
    end
  end
EOF
```

[http://localhost:3000/rails/mailers/devise/mailer/reset_password_instructions](http://localhost:3000/rails/mailers/devise/mailer/reset_password_instructions)

## [add in test/mailers/previews/devise]
```ruby
class Devise::MailerPreview < ActionMailer::Preview
  def reset_password_instructions
    Devise::Mailer.reset_password_instructions(User.first, {})
  end
end
```

```ruby
ActionMailer::Base.mail(to: 'jesherdevsk8@gmail.com', from: 'ecommerce@test.com', subject: 'Apenas Testando', body: 'xD').deliver_now!
```

## install and configure devise_token_auth

```bash
rails g devise:install
rails g devise_token_auth:install User auth/v1/user
rails db:migrate

rails g devise:views -v mailer
```

## generate controllers

```ruby
rails g controller admin/v1/api
rails g controller storefront/v1/api
```

## Config locales - [add in config/application.rb]

[active_record.pt-BR.yml](https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/pt-BR.yml)

[devise.pt-BR.yml](https://gist.github.com/mateusg/924555)

```ruby
# I18n config
config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}')]
config.i18n.default_locale = :'pt-BR'
```

```bash
mkdir -p config/locales/pt-BR
touch config/locales/pt-BR/{active_record,devise}.yml
```


## configure tests unit with Rspec

- add to gemfile

```ruby
group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'shoulda-matchers', '~> 4.0'
end
```

```bash
bundle install && rails g rspec:install
```

- configure factory_bot and shoulda_matchers

```bash
mkdir -p spec/support

cat << EOF >> spec/support/factory_bot.rb
  RSpec.configure do |config|
    config.include FactoryBot::Syntax::Methods
  end
EOF

cat << EOF >> spec/support/shoulda_matchers.rb
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
EOF
```
## [ add in spec/rails_helper.rb ]

```ruby
require 'rspec/rails'

Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }
```