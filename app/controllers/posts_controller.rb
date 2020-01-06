class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
  end

  def edit
    @post = Post.new(author_params)

    else render json:@author
     :new
    end 
  end

  def update
    @post.update(post_params)
    if @post.valid?
      @post.save
    redirect_to post_path(@post)
    else 
      render :new
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
