require 'rails_helper'

RSpec.describe User, type: :model do
  context "account を指定しているとき" do
    it "ユーザーが作られる" do
      user = User.new(name: "chinju", account: "chinju", email: "chinju@example.com")
      expect(user).to be_valid
    end
  end

  context "account を指定していないとき" do
    it "エラーする" do
      user = User.new(name: "chinju", account: nil, email: "chinju@example.com")
      user.valid?

      expect(user.errors.messages[:account]).to include "can't be blank"
    end
  end

  context "同名の account が存在するとき" do
    it "エラーする" do
      User.create!(name: "chinju", account: "chinju", email: "chinju@example.com")
      user = User.new(name: "chinju", account: "chinju", email: "chinju@example.com")
      user.valid?

      expect(user.errors.messages[:account]).to include "has already been taken"
    end
  end
end
