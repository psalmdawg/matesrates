class BusinessesController < ApplicationController

  def new
    @businesstypes = BusinessType.all
  end

  def create
    business = Business.new
    business.name = params[:name]
    business.website_url = params[:website_url]
    business.unit_no = params[:unit_no]
    business.address_1 = params[:address_1]
    business.address_2 = params[:address_2]
    business.suburb = params[:suburb]
    business.postcode = params[:postcode]
    business.about = params[:about]
    business.services = params[:services]
    business.user_id = current_user.id
    business.save
    redirect_to '/profile'
  end

  def index
    @business = Business.all
  end

  def show
    @business = Business.find(params[:id])
    user = User.all
    @user = user.find(@business.user_id).first_name
    @user_id = user.find(@business.user_id).id
  end


  def update
  end

  def destroy
  end

end
