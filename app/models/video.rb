# == Schema Information
#
# Table name: videos
#
#  id          :bigint           not null, primary key
#  description :text
#  search_word :string
#  thumbnail   :string
#  title       :string
#  view_count  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  youtube_id  :string
#
class Video < ApplicationRecord
  # 元動画が削除された場合、投稿はどうするか？
  has_many :posts, dependent: :destroy

  with_options presence: true do
    validates :search_word
    validates :youtube_id
    validates :title
    validates :description
    validates :thumbnail
    validates :view_count
  end

  def recently?
    updated_at > Time.current.weeks_ago(2)
  end
end
