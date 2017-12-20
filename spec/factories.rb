FactoryBot.define do
  factory :role do
    name "user"
  end
  factory :category_tag do
    name "Family"
    color "Blue"
  end
  factory :admin do
    email 'test@ex.com'
    password 'secret'
    nickname 'nick'

    # if needed
    # is_active true
  end
end
