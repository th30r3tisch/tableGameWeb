FactoryBot.define do
  factory :role do
    name "MyString"
  end
  factory :category_tag do
    name "MyString"
    color "MyString"
  end
  factory :event do
    name "MyString"
    startDate "2017-11-28"
    endDate "2017-11-28"
    description "MyText"
    ort "MyString"
  end
  factory :admin do
    email 'test@ex.com'
    password 'secret'

    # if needed
    # is_active true
  end
end