class MyShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart
  validate   :validate_units
  def set_cart_data (cart,product_id)
    @ip = cart
    @id = product_id 
  end
  def validate_units
    product = Product.find(@id) 
    shopping_cart = ShoppingCart.find(@ip).products.where(id:@id) 
    #raise (product.p_quantify > in_cart.count).to_json
		if product.p_quantify < shopping_cart.count 
			errors.add(:products, "Ah registrado todas las unidades disponibles")
		end
	end
end
