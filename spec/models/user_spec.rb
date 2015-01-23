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
end
