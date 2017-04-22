require 'rails_helper'

RSpec.describe Admin::OffersController, type: :controller do
  let(:offer) { build_stubbed :offer }

  let(:valid_attributes) { attributes_for :offer }
  let(:invalid_attributes) { attributes_for :invalid_offer }

  before :each do
    Offer.stub(:find).with(offer.id.to_s).and_return(offer)
    offer.stub(:save).and_return(true)
  end

  describe "offers#index" do
    before :each do
      Offer.stub(:all).and_return([offer])
      get :index
    end

    # it "assigns all offers as @offers" do
    #   expect(assigns(:offers)).to match_array [offer]
    # end

    # it "render the :index template" do
    #   expect(response).to render_template :index
    # end
  end

  describe "offers#show" do
    before :each do
      get :show, params: { id: offer.id }
    end
    
    it "assigns the requested offer to @offer" do
      expect(assigns(:offer)).to eq offer
    end

    it "render the :show template" do
      expect(response).to render_template :show
    end
  end

  describe "offers#new" do
    before :each do
      get :new
    end

    it "assigns a new offer" do
      expect(assigns(:offer)).to be_new_record
      expect(assigns(:offer)).to be_a_new(Offer)
    end

    it "render the :new template" do
      expect(response).to render_template :new
    end
  end

  describe "offers#edit" do
    before :each do
      get :edit, params: { id: offer.id } 
    end

    it "assigns the requested offer to @offer" do
      expect(assigns(:offer)).to eq offer
    end

    it "renders the :edit template" do
      expect(response).to render_template :edit
    end
  end

  describe "offers#create" do
    context "with valid attributes" do
      before :each do
        post :create, params: { offer: valid_attributes }
      end

      it "creates a new offer" do
        expect(Offer.exists?(assigns(:offer).id)).to be_truthy
      end

      it "redirects to offers#index" do
        expect(response).to redirect_to admin_offers_path
      end
    end

    context "with invalid attributes" do
      before :each do
        post :create, params: { offer: invalid_attributes }
      end

      it "does not save the new offer" do
        expect(Offer.exists?(offer.id)).to be_falsey
      end

      it "re-renders the :new method" do
        expect(response).to render_template :new
      end
    end
  end

  describe "offers#update" do
    context "with valid attributes" do
      before :each do
        # offer.stub(:update).with(valid_attributes.stringify_keys).and_return(true)
        expect_any_instance_of(Offer).to receive(:update).with(ActionController::Parameters.new(valid_attributes).permit(:category, :location, :detail, :rate, :image))
        put :update, params: { id: offer.id, offer: valid_attributes }
      end

      # it "updates the requested offer" do
      #   expect(assigns(:offer)).to eq offer
      # end

      # it "redirects to offers#index" do
      #   expect(response).to redirect_to admin_offers_path
      # end
    end

    context "with invalid attributes" do
      before :each do
        # offer.stub(:update).with(invalid_attributes.stringify_keys).and_return(false)
        expect_any_instance_of(Offer).to receive(:update).with(ActionController::Parameters.new(invalid_attributes).permit(:category, :location, :detail, :rate, :image))
        put :update, params: { id: offer.id, offer: invalid_attributes }
      end

      it "locates the requested offer" do
        expect(assigns(:offer)).to eq offer
      end

      it "does not change offer's attributes" do
        expect(assigns(:offer).attributes).to eq offer.attributes
      end

      it "re-renders the :edit template" do
        expect(response).to render_template :edit
      end
    end
  end

  describe "offers#destroy" do
    before :each do
      offer.stub(:destroy).and_return(true)
      delete :destroy, params: { id: offer.id }
    end

    it "deletes the offer" do
      expect(Offer.exists?(offer.id)).to be_falsey
    end

    it "redirects to offers#index" do
      expect(response).to redirect_to admin_offers_path
    end
  end

end
