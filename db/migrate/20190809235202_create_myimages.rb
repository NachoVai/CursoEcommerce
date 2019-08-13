class CreateMyimages < ActiveRecord::Migration[5.2]
  def change
    create_table :myimages do |t|
      t.attachment :img
      t.text :description
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
