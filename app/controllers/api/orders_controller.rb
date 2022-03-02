class Api::OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    product = Product.find(params[:product_id])
    order = current_user.orders.create
    order.items.create(product: product)
    render json: { message: 'Your order was created...' }, status: 201
  end

end