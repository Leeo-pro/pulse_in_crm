class Users::UsersController < Users::Base
  before_action :set_user, except: %i[index new create]
  before_action :user_access_authorization, except: %i[index new create]

  def index
    @users = User.where(company_id: current_user.company, role: 0)
  end

  def new
    @user = User.new(
      name:  'test',
      email: 'test@email.com'
    )
    @user.build_access_authorization
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "#{@user.name}の作成に成功しました"
      redirect_to users_user_url(@user)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = '更新しました'
      redirect_to users_user_url(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy!
    flash[:danger] = "#{@user.name}のユーザー情報を削除しました"
    redirect_to users_users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,
      access_authorization_attributes: %i[
        id inquiry_browse inqury_reply inqury_form_setting
      ]
    ).merge(company_id: current_user.company.id, role: 0)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_access_authorization
    @access_authorization = @user.access_authorization
  end
end
