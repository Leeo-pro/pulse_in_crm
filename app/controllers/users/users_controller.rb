class Users::UsersController < Users::Base
  def index; end

  def new
    @user = User.new(
      name: "test",
      email: "test@email.com"
    )
    @user.build_access_authorization
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.name}の作成に成功しました"
      redirect_to users_user_path(@user)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
    access_authorization_attributes: %i[ id inquiry_browse inqury_reply inqury_form_setting ]
    ).merge(company_id: current_user.company.id, role: 0)
  end
end
