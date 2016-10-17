class JobsController < ApplicationController

  def index
    if Job.all.count == 0
      @noJobs = "Whaaat? there are no fricking jobs around!"
    elsif params[:location].present?
      jobs = Job.near(params[:location], params[:proximity] || 10,  )
      @jobs = jobs
    else
      # @noJobs = 'there is nothing nearby'
      @jobs = Job.all
    end

    @user = User.all
    @jobtypes = JobType.all
  end

  def create
    job = Job.new
    job.title = params[:title]
    job.description = params[:description]
    job.price = params[:price]
    job.user_id = current_user.id
    job.timeframe = params[:timeframe]
    job.job_type_id = params[:job_type_id]
    job.street_number = params[:street_number]
    job.street = params[:street]
    job.suburb = params[:suburb]
    job.state = params[:state]
    job.postcode = params[:postcode]
    job.country = params[:country]
    # job.lat = params[:lat]
    # job.long = params[:long]

    job.save
    redirect_to '/profile'

  end

  # def location
  #
  #   if params[:location].present?
  #     jobs = Job.near(params[:location],
  #      params[:proximity])
  #
  #     @jobs = jobs
  #   else
  #     @noJobs = 'there is nothing nearby'
  #     @jobs = nil
  #   end
  #
  # end

  def show
    @job = Job.find(params[:id])
    user = User.all
    @user = user.find(@job.user_id).first_name
    @user_id = user.find(@job.user_id).id
    @jobtypes = JobType.all
    # @users = User.all
    if @job.suburb == nil
      @suburb = ""
    else
      @suburb = @job.suburb
    end

    if @job.state == nil
      @state = ""
    else
      @state =  ", " + @job.state
    end
  end

  def new
    @jobtypes = JobType.all
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update

    @job = Job.find(params[:id])
    @job.title = params[:title]
    @job.description = params[:description]
    @job.price = params[:price]
    @job.user_id= current_user.id
    @job.timeframe = params[:timeframe]
    @job.job_type_id = params[:job_type_id]
    @job.location = params[:location]
    @job.save

    if @job.save
    redirect_to '/profile'
  else
    render :edit
    end
  end

  def destroy
   @job = Job.find(params[:id])
   if @job.destroy
     redirect_to '/profile'
   else
     render :show
      end
    end


private
  def article_params
    params.require(:job).permit(:title, :description, :price, :timeframe   )
  end

end
