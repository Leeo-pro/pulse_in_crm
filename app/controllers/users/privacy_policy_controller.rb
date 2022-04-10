class Users::PrivacyPolicyController < Users::Base

  def create
    @privacy_policy = PrivacyPolicy.new(privacy_policy_params)
    if @privacy_policy.save
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  private

  def privacy_policy_params
    params.require(:privacy_policy).permit(:company_id, :content)
  end

end
