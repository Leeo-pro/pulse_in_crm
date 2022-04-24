module Users
  class InquiriesController < Users::Base
    def create 
      flash[:info] = "お問い合せ作成テスト"
      redirect_to users_dash_boards_path
    end
  end
end
