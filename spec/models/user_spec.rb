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

  describe "bio lenght" do
    it { expect(user).to ensure_length_of(:bio).is_at_most(2000).with_message("You are limited to 2000 characters")}
  end

  describe " use secure password" do
    it { expect(user).to have_secure_password}
  end

  context "Checking the association" do
    it { expect(user).to belong_to(:location) }
    it { expect(user).to have_many(:travelers) }
    it { expect(user).to have_many(:trips) }
    it { expect(user).to have_many(:created_trips) }
    it { expect(user).to have_many(:destinations) }
    it { expect(user).to have_many(:origins) }
    it { expect(user).to have_many(:search_results) }
    it { expect(user).to have_many(:search_result_locations) }
    it { expect(user).to have_many(:searched_locations) }
  end

end
