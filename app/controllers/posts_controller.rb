class PostsController < ApplicationController

  def new
    @trip = Trip.find(params[:trip_id])
    @post = Post.new
    render :new
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @post = @trip.posts.create!(post_params)
    redirect_to @trip, success: "Post was successfully created."
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