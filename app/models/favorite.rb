class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product


  validate :favorite_uniquess 
  def set_product(product_id, user_id)
    @product = product_id
    @user = user_id
  end
  private
  def favorite_uniquess
    favorite = Favorite.find_by(user_id:@user,product_id:@product)
  	if !favorite.nil?
  		errors.add(:favorites, "Ya esta registrado su producto en favoritos")
  	end
  end
end
