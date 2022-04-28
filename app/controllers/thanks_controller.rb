class ThanksController < ApplicationController
  def show
    @thank = Thank.find(params[:id])
  end
end
