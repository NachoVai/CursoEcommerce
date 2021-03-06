# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.last.update(permission_level:1)
u = User.last
@categories = []
5.times do |t|
  c = Category.create(name:"Categoria #{t}",description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed sed blandit nulla. Aliquam iaculis libero id viverra fermentum. Aenean et ornare diam, ac dictum lorem. Vivamus justo leo, malesuada id sapien et, blandit euismod risus. Etiam in felis pretium, ultricies metus ac, lobortis nulla. Aenean accumsan fringilla nisi, vel semper nisi auctor ut. Sed at nisl sed libero venenatis semper. Suspendisse a turpis augue. Morbi sagittis magna odio, id hendrerit ligula gravida in. Proin auctor sagittis leo quis elementum. Integer ullamcorper commodo mi nec congue. Praesent imperdiet at sem a lacinia. Nam ut eros et ipsum pellentesque bibendum pellentesque sed ante. In eget dui sapien. Cras commodo metus non mattis viverra. Sed sodales augue quis sagittis porttitor. Proin sit amet felis eget ex aliquet rutrum sed et nunc. Fusce ullamcorper tempor neque eu pharetra.")
  10.times do |tt|
    p = Product.new(
      p_name:"Producto #{tt}",
      p_description:"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus elementum sollicitudin porta. Curabitur malesuada, sapien nec scelerisque interdum, sapien ligula pharetra nulla, nec fringilla mi massa sit amet tortor. Nullam eget magna accumsan, vehicula quam molestie, tempus nisi. Etiam sapien dui, venenatis ut consectetur sit amet, tincidunt a lacus. Sed suscipit sit amet eros in malesuada. Curabitur condimentum at nunc non eleifend. Nullam dictum lectus urna, at condimentum quam dictum eget. Suspendisse nec sagittis ipsum. Maecenas eu urna leo. Vivamus mattis mattis eros in suscipit. Proin turpis odio, pretium at ultricies sit amet, mattis at arcu. Phasellus at arcu sapien. Morbi tempus eget sem et imperdiet. In venenatis, massa ut porta accumsan, neque justo imperdiet odio, ut rhoncus augue arcu id nulla. Aenean tincidunt cursus viverra. Etiam aliquet semper nibh vel iaculis. Integer accumsan lacinia convallis. In tincidunt sapien a turpis luctus, ac pharetra nisl consectetur. Ut aliquet blandit justo vehicula feugiat. Aenean congue tortor massa, laoreet pharetra eros finibus eget. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam in nisl a odio fermentum vulputate ut a erat. Aliquam molestie elit eu porta facilisis. Fusce porta nulla at euismod ultrices. Donec sed metus justo. Pellentesque nec consequat ante.",
      p_price: 1000.00,
      p_quantify: 50,
      p_send: 200.00,
      p_available: true,
      user_id: u.id,
      )
    p.categories = [c.id]
    p.save
    HasCategory.create(product:p,category:c)
    5.times do |ttt|
      Myimage.create(
        img:"", 
        description:"",
        product: p
        )
    end
  end
end
#image_tag @product.myimages.url(:medium),