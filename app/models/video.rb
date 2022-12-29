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
class Video < ApplicationRecord
  has_many :posts, dependent: :destroy

  with_options presence: true do
    validates :youtube_id
    validates :title
    validates :thumbnail
    validates :view_count
  end
end
