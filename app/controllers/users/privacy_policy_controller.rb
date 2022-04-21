class Users::PrivacyPolicyController < Users::Base

  def edit
    @privacy_policy = PrivacyPolicy.find(params[:id])
  end

  def update
    @privacy_policy = PrivacyPolicy.find(params[:id])
    if @privacy_policy.update(privacy_policy_params)
      flash[:success] = 'プライバシーポリシーを更新しました'
      # TODO:  /users/iquiry_form/:id/edit へ遷移
    else
      flash[:danger] = '■に全て入力してください。'
      render 'edit'
    end
  end

  private

  def privacy_policy_params
    params.require(:privacy_policy).permit(:content, :company_id)
  end
end
