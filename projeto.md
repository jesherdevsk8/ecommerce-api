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
