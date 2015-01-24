require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:search_result) {SearchResult.new(user_id: 1)}

  describe "validate presence" do
    it { expect(search_result).to validate_presence_of(:budget) }
  end
end
