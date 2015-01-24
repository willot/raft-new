require 'rails_helper'

RSpec.describe SearchResultLocation, :type => :model do
  let(:search_result_location) {SearchResultLocation.new}

  describe "validate presence" do
    it { expect(search_result_location).to validate_presence_of(:search_result) }
    it { expect(search_result_location).to validate_presence_of(:location) }
  end

  context "Checking the association" do
    it { expect(search_result_location).to belong_to(:search_result)}
    it { expect(search_result_location).to belong_to(:location)}
  end
end
