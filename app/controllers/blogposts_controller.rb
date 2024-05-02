class BlogpostsController < ApplicationController
  before_action :set_blogpost, except: [:index, :new, :create ] # or only: [:show, :edit, :update, :destroy]

  def index
    @blogposts = Blogpost.all
  end

  def show
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

  def edit
  end

  def update
    if @blogpost.update(blogpost_params)
      redirect_to @blogpost
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blogpost.destroy
    redirect_to root_path
  end

  private

  def blogpost_params
    params.require(:blogpost).permit(:title, :body)
  end

  def set_blogpost
    @blogpost = Blogpost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
end
