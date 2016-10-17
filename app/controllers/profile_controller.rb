class ProfileController < ApplicationController
  def index
    @user = User.find(current_user.id)
    if @user == nil
      redirect_to "/"
    end

    jobs = Job.all
    @jobs=jobs.where(user_id: current_user.id)

    businesses = Business.all
    @business = businesses.where(user_id: current_user.id)


  end

  def create
  end

  def show
  end
end
