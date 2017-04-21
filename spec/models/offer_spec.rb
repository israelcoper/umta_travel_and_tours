require 'rails_helper'

RSpec.describe Offer, type: :model do
  context "constants" do
    it { expect(Offer.categories).to eq({"default"=>0, "latest"=>1, "featured"=>2}) }
  end

  describe "validations" do
    it { should validate_presence_of :location }
    it { should validate_presence_of :detail }
    it { should validate_presence_of :rate }

    it { should validate_numericality_of :rate }
  end
end
