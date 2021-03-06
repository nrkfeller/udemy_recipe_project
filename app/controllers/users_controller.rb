class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end
  

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Account Created!'
      session[:user_id] = @user.id
      redirect_to courses_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'Updated Successfully!'
      redirect_to user_path(@user) # update to show chef page later on
    else
      render :edit
    end
  end
  
  def show
    @courses = @user.courses.paginate(page: params[:page], per_page: 3)
  end
  
  
  private
    def user_params
      params.require(:user).permit(:name,:email,:password)
    end
    
    def require_same_user
      if current_user != @user
        flash[:danger] = 'Unable to Access'
        redirect_to root_path
      end
    end
    
    def set_user
    @user = User.find(params[:id])
    end
    
end