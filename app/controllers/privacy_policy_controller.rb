class PrivacyPolicyController < ApplicationController
  def show
    @privacy_policy = PrivacyPolicy.find_by(company_id: params[:id])
  end
end
