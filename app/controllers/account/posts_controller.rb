class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to account_posts_path, alert:'Group Deleted'
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
