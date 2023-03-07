# == Schema Information
#
# Table name: laugh_logs
#
#  id                  :bigint           not null, primary key
#  button_pressed_time :float
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
#  fk_rails_...  (post_id => posts.id)
#
class LaughLog < ApplicationRecord
  belongs_to :post

  validates :button_pressed_time, presence: true

  # button_pressed_timeが整数もしくは浮動小数点数であることのバリデーションを追加
  # validate :button_pressed_time_is_must_be_integer_or_float

  # def button_pressed_time_is_must_be_integer_or_float
  #   unless button_pressed_time.is_a?(Integer) || button_pressed_time.is_a?(Float)
  #     errors.add(:button_pressed_time, "は無効な値です")
  #   end
  # end
  # saveメソッドの後に実行されるから、クライアント側かコントローラレベルのバリデーションが必要？
end
