class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configuraciones
  before_action :set_shopping_cart
  #before_action :authenticate_user!

  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_name, :age, :img, :state, :city, :street])
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:name, :email, :password, :user_name, :age, :img, :state, :city, :street)
    end
  end
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in?
      redirect_to root_path, alert: exception.message
    else
      redirect_to new_user_session_path, alert: exception.message
    end
  end

  def configuraciones
    @categories = Category.all
  end

  def set_shopping_cart
    if cookies[:shopping_cart_id].blank?
      @shopping_cart = ShoppingCart.create!(ip:request.remote_ip)
      cookies[:shopping_cart_id] = @shopping_cart.id
    else
      @shopping_cart = ShoppingCart.find(cookies[:shopping_cart_id])
    end
    rescue ActiveRecord::RecordNotFound => e
      @shopping_cart = ShoppingCart.create!(ip:request.remote_ip)
      cookies[:shopping_cart_id] = @shopping_cart.id
  end
  
end
