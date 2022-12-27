require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メール、パスワード、パスワード(確認)があれば有効であること" do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it "名前がなければ無効であること" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it "名前は20字以内であること" do
    user = FactoryBot.build(:user, name: 'a' * 21)
    user.valid?
    expect(user.errors[:name]).to include("is too long (maximum is 20 characters)")
  end

  it "メールがなければ無効であること" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "重複したメールなら無効であること" do
    FactoryBot.create(:user)
    user = FactoryBot.build(:user)
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "パスワードがなければ無効であること" do
    user = FactoryBot.build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "パスワードは最低6字であること" do
    user = FactoryBot.build(:user, password: 'pw')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
  end

  it "パスワード(確認)がなければ無効であること" do
    user = FactoryBot.build(:user, password_confirmation: nil)
    user.valid?
    expect(user.errors[:password_confirmation]).to include("can't be blank")
  end
end
