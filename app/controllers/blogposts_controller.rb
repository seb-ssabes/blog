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
end
