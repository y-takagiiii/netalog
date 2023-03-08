# == Schema Information
#
# Table name: laugh_logs
#
#  id                  :bigint           not null, primary key
#  button_pressed_time :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  post_id             :bigint           not null
#
# Indexes
#
#  index_laugh_logs_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
require 'rails_helper'

RSpec.describe LaughLog do
  let(:laugh_log) { create(:laugh_log) }

  it "post_id、button_pressed_timeがあれば有効であること" do
    expect(laugh_log).to be_valid
  end

  it 'post_idがなければ無効であること' do
    laugh_log.post_id = nil
    laugh_log.valid?
    expect(laugh_log.errors[:post]).to include("を入力してください")
  end

  it 'button_pressed_timeがなければ無効であること' do
    laugh_log.button_pressed_time = nil
    laugh_log.valid?
    expect(laugh_log.errors[:button_pressed_time]).to include("を入力してください")
  end

  fit 'button_pressed_timeは整数または浮動小数点数であること' do
    laugh_log.button_pressed_time = 'テキスト'
    laugh_log.valid?
    expect(laugh_log.errors[:button_pressed_time]).to include("は無効な値です")
  end
end
