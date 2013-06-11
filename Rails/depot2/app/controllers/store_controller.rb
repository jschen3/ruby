class StoreController < ApplicationController
  def index
    @products=Product.all #the local variable products is an array of all the product
    @count=increment_count
    @cart=current_cart
  end
  def increment_count
    if session[:counter].nil?
      session[:counter]=0
    else
      session[:counter]+=1
    end
  end
end
