class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @prototypes = Prototype.where(user_id: current_user.id).all
  end

private

def user_params
  params.require(:user).permit(:email, :password, :name, :profile, :position, :occupation)
end
  
end
