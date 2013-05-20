class StoreController < ApplicationController
  def index
    @products=Product.all #the local variable products is an array of all the product
  end

end
