class ChangeDefaultTypeProducts < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :p_price, :float  
    change_column :products, :p_send, :float    
  end
end
