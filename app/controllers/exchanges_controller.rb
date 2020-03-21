class ExchangesController < ApplicationController
  def index
    @exchanges = Exchange.order(:id)
  end

  def show
    @exchange = Exchange.find_by(id: params[:id])
  end

  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.user_id = current_user.id
    if @exchange.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @exchange = current_user.exchanges.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'message/show'
    end
  end

  private

  def exchange_params
    params.require(:exchange).permit(:content, :request_id)
  end
end
