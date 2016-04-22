class UsersController < ApplicationController
  
  before_action :collect_user, only: [:edit, :update]
  
  def show # 追加
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit # 追加
    @user = User.find(params[:id])
  end

  def update # 追加
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Updated"
      redirect_to @user
    else
      render 'edit'
    end
  end 
  

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :location)
  end
  
  def collect_user
    user = User.find(params[:id])
    redirect_to(root_url) if user != current_user
  end
end