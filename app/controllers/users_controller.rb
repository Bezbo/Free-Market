class UsersController < Clearance::UsersController

  before_filter :authorize, only: [:edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end


  def update
    if @user.update_attributes(user_attributes)
      redirect_to @user, notice: 'User data was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @user.destroy

    redirect_to users_url
  end

  private

  def user_attributes
    if current_user.role != "admin"
      params.require(:user).except(:role)
    else
      params.require(:user).permit(:role)
    end
  end

end
