class Admin::OffersController < ApplicationController
  before_action :find_offer, only: [:show, :edit, :update, :destroy]

  layout "admin"

  def index
    @offers = Offer.page(page).per(10)
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    if @offer.save
      redirect_to admin_offers_path, notice: "Offer was created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @offer.update(offer_params)
      redirect_to admin_offers_path, notice: "Offer was updated succesfully!"
    else
      render :edit
    end
  end

  def destroy
    @offer.destroy
    redirect_to admin_offers_path, notice: "Offer was destroyed successfully!"
  end

  protected

  def offer_params
    params.require(:offer).permit(:category, :location, :detail, :rate)
  end

  def find_offer
    @offer ||= Offer.find(params[:id])
  end

end
