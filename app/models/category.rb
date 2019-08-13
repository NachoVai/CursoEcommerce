class Category < ApplicationRecord
    has_attached_file :c_img,
        styles: {
            thumb:      { geometry: '500x500',  format: :png, convert_options: "-background white -gravity center"},       
            medium:     { geometry: '630x315',  format: :png, convert_options: "-background white -gravity center"},  
            big:        { geometry: '920x560',  format: :png, convert_options: "-background white -gravity center"}
        },
        default_url: "/images/:style/missing.png"
    validates_attachment_content_type :c_img, content_type: /\Aimage\/.*\z/
    validates :name, presence: true, length: {minimum: 10, too_short: "Minimo son %{count} caracteres."}
    validates :description, presence: true, length: {minimum: 100, too_short: "Minimo son %{count} caracteres."}
    has_many :has_categories, :dependent => :destroy
    has_many :products, through: :has_categories, :dependent => :destroy
end
