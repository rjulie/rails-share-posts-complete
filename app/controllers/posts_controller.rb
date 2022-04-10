class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
      # render modal instead of new to fix
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = @post.comments.where(post_id: @post.id)
    @comment.each(&:destroy)
    @post.destroy
    redirect_to posts_path, notice: "Your post has been deleted successfully."
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :url, :user_id)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
