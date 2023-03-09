# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#  video_id   :bigint           default(0), not null
#
# Indexes
#
#  index_posts_on_user_id   (user_id)
#  index_posts_on_video_id  (video_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (video_id => videos.id)
#
class Post < ApplicationRecord
  belongs_to :user
  belongs_to :video

  has_many :laugh_logs, dependent: :destroy
  has_many :likes, dependent: :destroy

  def new?
    created_at > Time.current.yesterday
  end

  def count_button_pressed_times
    laugh_logs.count
  end
end
