class ChargesController < ApplicationController
  def new
    @request = Request.find_by(id: params[:request_id])
  end

  def create
    @request = Request.find_by(id: params[:request_id])
    @amount = @request.money

    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: '依頼料金の決済',
      currency: 'jpy',
    })

    @request.payment = true
    @request.save
    flash[:success] = '振り込みが完了しました。'
    redirect_to new_charge_path(request_id: @request.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
