# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  crypted_password :string
#  email            :string           not null
#  name             :string           not null
#  salt             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require 'rails_helper'

RSpec.describe User do
  let(:user) { build(:user) }

  it "名前、メール、パスワード、パスワード(確認)があれば有効であること" do
    expect(user).to be_valid
  end

  it "名前がなければ無効であること" do
    user.name = nil
    user.valid?
    expect(user.errors[:name]).to include("を入力してください")
  end

  it "名前は20文字以内であること" do
    user.name = 'a' * 21
    user.valid?
    expect(user.errors[:name]).to include("は20文字以内で入力してください")
  end

  it "メールがなければ無効であること" do
    user.email = nil
    user.valid?
    expect(user.errors[:email]).to include("を入力してください")
  end

  it "重複したメールなら無効であること" do
    create(:user)
    user.valid?
    expect(user.errors[:email]).to include("はすでに存在します")
  end

  it "パスワードがなければ無効であること" do
    user.password = nil
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  it "パスワードは最低6字であること" do
    user.password = 'pw'
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください")
  end

  it "パスワード(確認)がなければ無効であること" do
    user.password_confirmation = nil
    user.valid?
    expect(user.errors[:password_confirmation]).to include("を入力してください")
  end
end
