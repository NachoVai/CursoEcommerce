class HomeController < ApplicationController
  #before_action :authenticate_user!, except: :index
  def index
  end

  def purchases
  end

  def history
  end

  def favorites
  end

  def search
    @products = Product.where("p_name LIKE :query", query: "%#{params[:find]}%")
  end
end
