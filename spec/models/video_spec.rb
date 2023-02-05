# == Schema Information
#
# Table name: videos
#
#  id          :integer          not null, primary key
#  description :text
#  search_word :string
#  thumbnail   :string
#  title       :string
#  view_count  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  youtube_id  :string
#
require 'rails_helper'

RSpec.describe Video do
  let(:video) { build(:video) }
  let(:old_video) { build(:video, :old_video) }

  describe "validation" do
    it '検索ワード、youtube_id、詳細(概要欄)、サムネイル、タイトル、再生回数があれば有効であること' do
      expect(video).to be_valid
    end

    it "検索ワードがなければ無効であること" do
      video.search_word = nil
      video.valid?
      expect(video.errors[:search_word]).to include("を入力してください")
    end

    it "youtube_idがなければ無効であること" do
      video.youtube_id = nil
      video.valid?
      expect(video.errors[:youtube_id]).to include("を入力してください")
    end

    it "詳細(概要欄)がなければ無効であること" do
      video.description = nil
      video.valid?
      expect(video.errors[:description]).to include("を入力してください")
    end

    it "サムネイルがなければ無効であること" do
      video.thumbnail = nil
      video.valid?
      expect(video.errors[:thumbnail]).to include("を入力してください")
    end

    it "タイトルがなければ無効であること" do
      video.title = nil
      video.valid?
      expect(video.errors[:title]).to include("を入力してください")
    end

    it "再生回数がなければ無効であること" do
      video.view_count = nil
      video.valid?
      expect(video.errors[:view_count]).to include("を入力してください")
    end
  end

  describe "instance method" do
    it "recently?メソッドが新しいvideoインスタンスに対してtrueを返すこと" do
      expect(video.recently?).to be_truthy
    end

    it "recently?メソッドが古いvideoインスタンスに対してfalseを返すこと" do
      expect(old_video.recently?).to be_falsey
    end
  end
end
