class TripsController < ApplicationController

	before_action :authenticate_user!

	def index
		@user = current_user
		@trips = current_user.trips.order(updated_at: :desc)
		render :index
	end

	def new
		@trip = Trip.new
		render :new
	end

	def create
		# @user = current_user
		@trip = current_user.trips.build(trip_params)
		if @trip.save
			flash[:success] ="You have successfully made a new trip."
			redirect_to @trip
		else 
			flash[:error] = "Could not save trip: #{@trip.errors.full_messages.join(".")}"
			render action: "new"
		end

    # redirect_to @trip, success: "You have successfully made a new trip."
		# @trip = current_user.trips.create(trip_params)
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
		redirect_to trips_path
	end

	def destroy
		trip = Trip.find(params[:id])
		trip.destroy
		redirect_to trips_path
	end

	private

		def trip_params
			params.require(:trip).permit(:title, :location, :start_date, :end_date)
		end

end