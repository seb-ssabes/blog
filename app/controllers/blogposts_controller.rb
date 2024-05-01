class BlogpostsController < ApplicationController
  def initialize

  end

  def index
    @blogposts = Blogpost.all
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @blogpost = Blogpost.new
  end

  def create
    @blogpost = Blogpost.new(blogpost_params)
    if @blogpost.save
      redirect_to @blogpost
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def blogpost_params
    params.require(:blogpost).permit(:title, :body)
  end
end
