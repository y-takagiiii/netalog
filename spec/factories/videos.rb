# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  description :text
#  search_word :string
#  thumbnail   :string
#  title       :string
#  view_count  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  youtube_id  :string
#
FactoryBot.define do
  factory :video do
    search_word { "Mystring" }
    youtube_id { "MyString" }
    title { "MyString" }
    description { "MyText" }
    thumbnail { "MyString" }
    view_count { 100_000 }
    updated_at { Time.current }

    trait :old_video do
      updated_at { Time.current.weeks_ago(2) }
    end
  end
end
