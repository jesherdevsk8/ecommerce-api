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
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = { address: 'localhost', port: 1025 }
```

```ruby
ActionMailer::Base.mail(to: 'jesherdevsk8@gmail.com', from: 'ecommerce@test.com', subject: 'Apenas Testando', body: 'xD').deliver_now!
```