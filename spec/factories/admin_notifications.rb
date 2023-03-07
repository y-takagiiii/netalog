FactoryBot.define do
  factory :admin_notification do
    user { nil }
    title { "MyString" }
    content { "MyText" }
  end
end
