class RequestsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def new
    @request = current_user.requests.new
  end

  def show
    @request = Request.find(params[:id])
  end

  def create
    @request = current_user.requests.build(request_params)
    if @request.save
      flash[:success] = '依頼を投稿しました。'
      redirect_to root_url
    else
      @request = current_user.requests.order(id: :desc).page(params[:page])
      flash.now[:danger] = '依頼の投稿に失敗しました。'
      render 'requests/new'
    end
  end

  def destroy
    @request.destroy
    flash[:success] = '依頼の投稿を削除しました。'
    redirect_to root_url
  end
  
  private

  def request_params
    params.require(:request).permit(:title, :content, :online_or_offline, :prefecture, :station, :money)
  end
  
  def message_params
    params.require(:message).permit(:content)
  end
  
  def correct_user
    @request = current_user.requests.find_by(id: params[:id])
    unless @request
      redirect_to root_url
    end
  end
end
