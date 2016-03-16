class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments
  end
  
  def new
    @post = Post.new
  end
  
  def create
    post = Post.new(post_params)
    post.user = current_user
    if post.save!
      redirect_to posts_path
    else
      render :new
    end
  end
  
  # Ensure security
  private   
  def post_params
#    binding.pry
    params.require(:post).permit(:title, :content, category_ids: [])
  end
  
#  strong parameter
#  mass-update
  
end
