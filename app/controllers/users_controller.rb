class UsersController < ApplicationController
  before_action :move_to_index

  def create
  end

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def delete
  end

  def profile
    @user = User.find(params[:id])
  end

  def card_registration
    @user = User.find(params[:id])
  end

  def user_info_register
    @user = User.find(params[:id])
  end
  def user_page
  end
  def logout
  end

  private

  def user_params
    params.require(:user).permit(:password, :email, :nickname, :profile, :phone_number, :prefecture, :city, :address, :postal_code, :building_name, :profile, :last_name, :first_name,:last_name_kana, :first_name_kana)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end