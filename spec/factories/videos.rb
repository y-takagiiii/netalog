FactoryBot.define do
  factory :video do
    youtube_id { "MyString" }
    title { "MyString" }
    description { "MyText" }
    thumbnail { "MyString" }
    view_count { 1 }
  end
end
