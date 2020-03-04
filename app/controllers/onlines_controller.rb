class OnlinesController < ApplicationController
  def index
    @requests = Request.where(online_or_offline: "0").order(id: :desc).page(params[:page])
  end
end
