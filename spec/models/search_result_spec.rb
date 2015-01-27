require 'rails_helper'

RSpec.describe SearchResult, :type => :model do
  let(:search_result) {SearchResult.new(user_id: 1)}

  describe "validate presence" do
    it { expect(search_result).to validate_presence_of(:budget) }
    # it { expect(search_result).to validate_presence_of(:user) }
    it { expect(search_result).to validate_presence_of(:start_at) }
    # it { expect(search_result).to validate_presence_of(:end_at) }
  end

  context "Checking the association" do
    it { expect(search_result).to belong_to(:user) }
    it { expect(search_result).to have_many(:search_result_locations) }
    it { expect(search_result).to have_many(:locations) }
  end
end
