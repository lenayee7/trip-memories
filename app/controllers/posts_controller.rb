class PostsController < ApplicationController

 # def new
 # 		# @trip = Trip.find(params[:trip_id])
 # 		@post = Post.new
 # 		render :new
 # end

 def create
    @trip = Trip.find(params[:trip_id])
    @post = @trip.posts.create(post_params)
    redirect_to @trip
  end

 def show
 		@trip = Trip.find(params[:trip_id])
 		@post = @trip.posts
 end

 def edit
 		@trip = Trip.find(params[:trip_id])
 		 p @trip
    # @post = @trip.posts
    render :edit
 end

 def update
 		trip = Trip.find(params[:trip_id])
 		@post = @trip.posts
 end

  private
    def post_params
      params.require(:post).permit(:title, :content, :photo)
    end

end