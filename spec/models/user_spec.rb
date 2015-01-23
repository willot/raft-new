require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) {User.new(username: "test")}

  describe "validate presence" do
    it { expect(user).to validate_presence_of(:username) }
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_presence_of(:first_name) }
    it { expect(user).to validate_presence_of(:last_name) }
  end

  describe "validate uniqueness" do
    it { expect(user).to validate_uniqueness_of(:username) }
    it { expect(user).to validate_uniqueness_of(:email) }
  end

  describe "password length" do
    it { expect(user).to ensure_length_of(:password).is_at_most(20).with_message("You are limited to 20 characters")}
    it { expect(user).to ensure_length_of(:password).is_at_least(6).with_message("You need at least 6 characters")}
  end

  describe "bio lenght" do
    it { expect(user).to ensure_length_of(:bio).is_at_most(2000).with_message("You are limited to 2000 characters")}
  end

  describe " use secure password" do
    it { expect(user).to have_secure_password}
  end

end
