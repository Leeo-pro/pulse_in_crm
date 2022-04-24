# frozen_string_literal: true

module Users
  class CompaniesController < Users::Base
  before_action :set_company

    def show; end
    
    def edit; end

    def update
      if @company.update(company_email_params)
        flash[:success] = '企業メールアドレスを更新しました'
        redirect_to users_company_url
      else
        render 'edit'
      end
    end

    private

    def set_company
      @company = current_company
    end

    def company_email_params
      params.require(:company).permit(:email)
    end
  end
end
