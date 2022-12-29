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
require 'rails_helper'

RSpec.describe Video do
  it 'youtube_id、詳細(概要欄)、サムネイル、タイトル、再生回数があれば有効であること' do
    video = build(:video)
    expect(video).to be_valid
  end

  it "youtube_idがなければ無効であること" do
    video = build(:video, youtube_id: nil)
    video.valid?
    expect(video.errors[:youtube_id]).to include("を入力してください")
  end

  it "詳細(概要欄)がなければ無効であること" do
    video = build(:video, description: nil)
    video.valid?
    expect(video.errors[:description]).to include("を入力してください")
  end

  it "サムネイルがなければ無効であること" do
    video = build(:video, thumbnail: nil)
    video.valid?
    expect(video.errors[:thumbnail]).to include("を入力してください")
  end

  it "タイトルがなければ無効であること" do
    video = build(:video, title: nil)
    video.valid?
    expect(video.errors[:title]).to include("を入力してください")
  end

  it "再生回数がなければ無効であること" do
    video = build(:video, view_count: nil)
    video.valid?
    expect(video.errors[:view_count]).to include("を入力してください")
  end
end
