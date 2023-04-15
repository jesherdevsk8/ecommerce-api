## Criando os models

```bash
rails g model Category name
rails g model SystemRequirement name operational_system storage processor memory video_board
rails g model Product name description:text "price:decimal{10,2}" productable:references{polymorphic}
rails g model Game mode:integer release_date:datetime developer system_requirement:references
rails g model ProductCategory product:references category:references

touch spec/factories/users.rb
touch spec/models/user_spec.rb

rails g model Coupon name code status:integer "discount_value:decimal{5,2}" max_use:integer due_date:datetime

```
## Validação customizada do cupon
```bash
mkdir -p app/validators
touch app/validators/future_date_validator.rb

cat << EOF >>  app/validators/future_date_validator.rb
class FutureDateValidator < ActiveModel::EachValidator

end
EOF

```

- *[ Adicione em config/application.rb ]*

```ruby
config.api_only = true

config.autoload_paths += %W["#{config.root}/app/validators/"]
```

- *[ Crie um diretório spec/validators e o arquivo para testar o FutureDateValidator ]*

```bash
mkdir -p spec/validators

cat << EOF >> spec/validators/future_date_validator_spec.rb
require "rails_helper"

class Validatable
  include ActiveModel::Validations
  attr_accessor :date
  validates :date, future_date: true
end
EOF
```

- *[ Crie um arquivo config/locales/pt-BR/custom_validations.yml ]*

```bash
cat << EOF >> config/locales/pt-BR/custom_validations.yml
pt-BR:  
  activerecord:
    errors:
      messages:
        future_date: "deve ser uma data futura"

EOF
```