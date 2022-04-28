class Users::ThanksController < Users::Base
  before_action :user_other_access
  before_action :set_thank, only: %i[edit update]

  def new
    @thank = Thank.new
  end

  def create
    @thank = Thank.new(thank_params)
    if @thank.save
      flash[:success] = "サンクスページを新規登録しました。"
      redirect_to thank_url(@thank)
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @thank.update(thank_params)
      flash[:success] = "サンクスページを更新しました。"
    else
      flash[:danger] = "項目を記入してください。"
      render :edit
    end
  end

  private
    def thank_params
      params.require(:thank).permit(:thank).merge(company_id: current_company.id)
    end

    def set_thank
      @thank = Thank.find(params[:id])
    end
end
