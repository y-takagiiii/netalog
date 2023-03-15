# == Schema Information
#
# Table name: play_list_posts
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  play_list_id :bigint           not null
#  post_id      :bigint           not null
#
# Indexes
#
#  index_play_list_posts_on_play_list_id              (play_list_id)
#  index_play_list_posts_on_play_list_id_and_post_id  (play_list_id,post_id) UNIQUE
#  index_play_list_posts_on_post_id                   (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (play_list_id => play_lists.id)
#  fk_rails_...  (post_id => posts.id)
#
FactoryBot.define do
  factory :play_list_post do
    play_list { nil }
    post { nil }
  end
end
