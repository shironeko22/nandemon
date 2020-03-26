class RequestsController < ApplicationController
  before_action :require_user_logged_in, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:destroy]

  def new
    @request = current_user.requests.new
  end

  def show
    @request = Request.find(params[:id])
    @message = Message.new
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

  def agree
    @request = Request.find_by(id: params[:request_id])
    @request.update_attribute(:agreement, true)
    flash[:success] = '依頼を受けました'
    redirect_to exchanges_path
  end

  def new_report
    @request = Request.find_by(id: params[:id])
    @exchange = Exchange.new
  end

  def send_report
    @exchange = Exchange.new(exchange_params)
    @exchange.user_id = current_user.id
    if @exchange.save
      @exchange.request.update_attribute(:status, 'confirm')
      flash[:success] = '完了報告しました。'
      redirect_to root_url
    else
      @exchange = current_user.exchanges.order(id: :desc).page(params[:page])
      flash.now[:danger] = '完了報告に失敗しました。'
      render 'requests/new_report'
    end
  end

  def modification_request
    @request = Request.find_by(id: params[:id])
    @request.update_attribute(:status, 'revise')
    flash[:success] = '修正依頼を送信しました。'
    redirect_to exchanges_path
  end

  def finish
    @request = Request.find_by(id: params[:id])
    @request.update_attribute(:status, 'complete')
    flash[:success] = 'やりとりが完了しました。'
    redirect_to root_path
  end


  private

  def request_params
    params.require(:request).permit(:title, :content, :online_or_offline, :prefecture, :station, :money)
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def exchange_params
    params.require(:exchange).permit(:content, :request_id)
  end

  def correct_user
    @request = current_user.requests.find_by(id: params[:id])
    unless @request
      redirect_to root_url
    end
  end
end
