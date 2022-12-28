# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Post do
  it "user_idがあれば有効であること" do
    post = build(:post)
    expect(post).to be_valid
  end

  it "user_idがなければ無効であること" do
    post = build(:post, user_id: nil)
    post.valid?
    expect(post.errors[:user]).to include("を入力してください")
  end
end
