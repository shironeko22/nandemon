class MessagesController < ApplicationController
  def index
    @messages = Message.where(request_id: current_user.requests)
  end

  def show
    @message = Message.find_by(id: params[:id])
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @message = current_user.messages.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'requests/show'
    end
  end

  def destroy
  end

  private

  def message_params
    params.require(:message).permit(:content, :request_id)
  end
end
