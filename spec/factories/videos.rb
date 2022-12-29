# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  description :text
#  thumbnail   :string
#  title       :string
#  view_count  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  youtube_id  :string
#
FactoryBot.define do
  factory :video do
    youtube_id { "MyString" }
    title { "MyString" }
    description { "MyText" }
    thumbnail { "MyString" }
    view_count { 1 }
  end
end
