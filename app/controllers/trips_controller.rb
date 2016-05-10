class TripsController < ApplicationController

	before_action :authenticate_user!

	def index
		Trip.where(user_id: current_user.id)
		p current_user
		@trips = current_user.trips
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

	# def destroy
		
	# end

	private

		def trip_params
			params.require(:trip).permit(:title, :location, :start_date, :end_date)
		end

end