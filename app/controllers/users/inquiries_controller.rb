module Users
  class InquiriesController < Users::Base
    def create
      if current_company.inquiries.create
        flash[:success] = "お問い合わせデータが作成されました"
      else
        flash[:danger] = "お問い合わせデータの作成に失敗しました"
      end
      redirect_to users_dash_boards_path
    end
  end
end
