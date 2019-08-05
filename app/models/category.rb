class Category < ApplicationRecord
    has_attached_file :c_img,
        styles: {
            thumb:      { geometry: '500x500',  format: :png, convert_options: "-background white -gravity center"},       
            medium:     { geometry: '630x315',  format: :png, convert_options: "-background white -gravity center"},  
            big:        { geometry: '920x560',  format: :png, convert_options: "-background white -gravity center"}
        },
        default_url: "/images/:style/missing.png"
    validates_attachment_content_type :c_img, content_type: /\Aimage\/.*\z/
end
