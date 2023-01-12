# == Schema Information
#
# Table name: laugh_logs
#
#  id                  :integer          not null, primary key
#  button_pressed_time :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  post_id             :integer          not null
#
# Indexes
#
#  index_laugh_logs_on_post_id  (post_id)
#
# Foreign Keys
#
#  post_id  (post_id => posts.id)
#
FactoryBot.define do
  factory :laugh_log do
    association :post
    button_pressed_time { 1 }
  end
end
