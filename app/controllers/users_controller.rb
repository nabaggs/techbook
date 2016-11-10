class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user,only: [:show,:index]
  def index
    case params[:people]
    when "friends"
      @users=current_user.get_friends
    when "pending"
      @users=current_user.get_pending
    when "requested"
      @users=current_user.get_requests
    else
      @users=User.where.not(id: current_user.id)
    end
  end
  def show
    @message=Message.new
    @post=Post.new
    @posts=@user.posts.order('created_at DESC')
    @activities=PublicActivity::Activity.where(owner_id: @user.id)
  end
  private
  def set_user
  	@user=User.find_by(username: params[:id])
  end
end
