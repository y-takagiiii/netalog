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
end
