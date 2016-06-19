class TripsController < ApplicationController

	before_action :authenticate_user!

	def get_coordinates
		@user = current_user
		@trips = current_user.trips.order(created_at: :desc)
		@trip_coords = @trips.map do |trip| 
			[trip.title,trip.location,trip.latitude,trip.longitude,trip.id]
		end
	  render json: @trip_coords
	end

	def get_photos
		@trip = current_user.trips.find(params[:id])
		@posts = @trip.posts.order(created_at: :desc)
		@photos = @posts.map do |post|
				[post.image_file_name]
		end
		render json: @photos
	end

	def index
		@user = current_user
		@trips = current_user.trips.order(created_at: :desc)
		render :index
	end

	def new
		@trip = Trip.new
		render :new
	end

	def create
		@trip = current_user.trips.build(trip_params)
		if @trip.save
			flash[:success] ="You have successfully made a new trip."
			redirect_to @trip
	else 
			flash[:error] = "Could not save trip: #{@trip.errors.full_messages.join(".")}"
			render action: "new"
		end
  end

	def show
		@trip = current_user.trips.find(params[:id])
		@posts = @trip.posts.order(created_at: :desc)
		render :show
	end

	def edit
		@trip = Trip.find(params[:id])
		render :edit
	end

	def update
		trip = Trip.find(params[:id])
		trip.update(trip_params)
		redirect_to trip_path
	end

	def destroy
		trip = Trip.find(params[:id])
		trip.destroy
		redirect_to trips_path
	end

	private

		def trip_params
			params.require(:trip).permit(:title, :location, :cover_image, :start_date, :end_date, :latitude, :longitude)
		end

end