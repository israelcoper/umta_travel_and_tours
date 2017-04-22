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

    it { should have_attached_file(:image) }
    it { should validate_attachment_presence(:image) }
    it { should validate_attachment_content_type(:image).allowing('image/png', 'image/gif').rejecting('text/plain', 'text/xml') }
 
  end

  context "scope" do
    let(:offer_1) { create(:offer, category: "featured") }
    let(:offer_2) { create(:offer, category: "featured") }
    let(:offer_3) { create(:offer, category: "featured") }

    describe "featured" do
      it { expect(Offer.featured).to match_array [offer_1, offer_2, offer_3] }
    end
  end
end
