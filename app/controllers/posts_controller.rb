class PostsController < ApplicationController

 def new
	@trip = Trip.find(params[:trip_id])
	@post = Post.new
	render :new
 end

 def create
    @trip = Trip.find(params[:trip_id])
    p post_params
    # p post.errors.full_messages
    @post = @trip.posts.create!(post_params)
    # flash[:notice] = "You have created a new post."
    redirect_to @trip, notice: "Post was successfully created."
  end

 def show
	@trip = Trip.find(params[:trip_id])
	@post = @trip.posts(created_at: :desc)
 end

 def edit
 	@trip = Trip.find(params[:trip_id])
    @post = Post.find(params[:id])
    render :edit
 end

 def update
    trip = Trip.find(params[:trip_id])
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to trip
 end

 def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to post.trip
 end

  private
    def post_params
      params.require(:post).permit(:title, :content, :image)
    end

end