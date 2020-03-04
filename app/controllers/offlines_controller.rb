class OfflinesController < ApplicationController
  def index
    @requests = Request.where(online_or_offline: "1").order(id: :desc).page(params[:page])
  end
end
