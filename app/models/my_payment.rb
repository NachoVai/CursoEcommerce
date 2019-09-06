class MyPayment < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :shopping_cart, :dependent => :destroy
  has_many :products, through: :shopping_cart

	aasm column: "status" do
		state :created, initial: true
		state :payed
    state :failed
		event :pay do
			after do
				shopping_cart.pay!
			end
			transitions from: :created, to: :payed
		end
	end
end
