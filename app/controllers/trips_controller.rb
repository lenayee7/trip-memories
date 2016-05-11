class TripsController < ApplicationController

	before_action :authenticate_user!

	def index
		@trips = current_user.trips.order(updated_at: :desc)
		render :index
	end

	def new
		@trip = Trip.new
		render :new
	end

	def create
		@trip = current_user.trips.create(trip_params)
    redirect_to @trip
	end

	def show
		@trip = current_user.trips.find(params[:id])
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