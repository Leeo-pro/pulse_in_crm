# frozen_string_literal: true

module Users
  class CompaniesController < Users::Base
    def show
      @current_company = current_company
    end
    def edit; end
    def update; end
  end
end
