# frozen_string_literal: true

module Users
  class DashBoardsController < Users::Base
    def index
      # 企業独自のサンクスページを取得
      @thank = Thank.find_by(company_id: current_user.company_id)
    end
  end
end
