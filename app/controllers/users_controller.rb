class UsersController < Clearance::UsersController

  before_filter :authorize, only: [:edit, :update, :destroy]
  load_and_authorize_resource


  def change_user_role
    if user.role == "admin" || "moderator" || "user"
      @user.save_role
    else
      raise "Can't do that."
    end
  end

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end


  def update
    if @user.update_attributes(params[:item])
      redirect_to @user, notice: 'User data was successfully updated.'
    else
      render action: "edit" 
    end
  end

  def destroy
    @user.destroy

    redirect_to users_url
  end

end
