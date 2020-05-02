class ToppagesController < ApplicationController
  def index
    @requests = Request.all.order(id: :desc).page(params[:page])
  end
end
