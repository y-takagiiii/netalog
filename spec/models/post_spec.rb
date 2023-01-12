# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#  video_id   :integer          default(0), not null
#
# Indexes
#
#  index_posts_on_user_id   (user_id)
#  index_posts_on_video_id  (video_id)
#
# Foreign Keys
#
#  user_id   (user_id => users.id)
#  video_id  (video_id => videos.id)
#
require 'rails_helper'

RSpec.describe Post do
  let(:post) { create(:post) }

  it "user_id、video_idがあれば有効であること" do
    expect(post).to be_valid
  end

  it "user_idがなければ無効であること" do
    post.user_id = nil
    post.valid?
    expect(post.errors[:user]).to include("を入力してください")
  end

  it "video_idがなければ無効であること" do
    post.video_id = nil
    post.valid?
    expect(post.errors[:video]).to include("を入力してください")
  end
end
