class JobTypesController < ApplicationController

  def index

  end

  def create

  end

  def show
    alljobs = Job.all
    job = alljobs.where(job_type_id: params[:id])
    @jobs = job

    if job.count == 0
      @none = "*There are currently no jobs listed in this category*"
    else
    end


    @jobtypes = JobType.all
    @thisjobtype = @jobtypes.find(params[:id])

  end

  def new

  end

end
