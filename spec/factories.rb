FactoryBot.define do
    factory :conta do
      numero { Faker::Bank.account_number(digits: 5) }
      saldo { Faker::Number.decimal(l_digits: 2) }
      bloqueada { Faker::Boolean.boolean }
    end
  end
