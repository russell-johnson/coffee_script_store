class ProductsController < ApplicationController
  def index
  end

  def product_card
    @product = params[:product]
    render(partial: 'product_card')
  end

  def detail_card
    @product = params[:product]
    render(partial: 'product_card')
  end


end
