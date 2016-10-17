module Api
    class JobsController < ApplicationController

      def index
        jobs = Job.all
        render json: jobs.to_json, status: 201
      end

      def new
        # go to create form
      end

      def create
        job = Job.new
        job.title = params[:title]
        job.description = params[:description]
        job.price = params[:price]
        job.user_id = current_user.id
        job.time_frame = params[:timeframe]
        render json: job.to_json, status: 201
      end

      def show
        # job = Job.find(params[:id])
        # render json: artist.to_json, status: 201
      end

      def update
        # artist = Artist.find(params[:id])
        # artist.name = params[:name]
        # artist.gender = params[:gender]
        # artist.image = params[:image]
        # artist.event_id = params[:event_id]
        # artist.save
        # render json: artist.to_json, status: 201
      end

      def destroy
        # artist = Artist.find(params[:id])
        # artist.destroy
      end

    end
end
