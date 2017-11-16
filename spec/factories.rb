FactoryBot.define do
  factory :admin do
    email 'test@ex.com'
    password 'secret'

    # if needed
    # is_active true
  end
end