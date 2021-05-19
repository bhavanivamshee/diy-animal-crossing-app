# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

10.times do
    User.create(
        island_name: Faker::Movies::HarryPotter.location, 
        username: Faker::Movies::HarryPotter.character, 
        email: Faker::Internet.email,
        dream_address: "1234-1234-1234",
        password: "123")
end

Diy.destroy_all

resp = RestClient::Request.execute(method: :get,
       url: "https://api.nookipedia.com/nh/recipes",
       headers:{
           'X-API-KEY': ENV['NOOK_KEY']
               })
               
       diy_data = JSON.parse(resp.body)
 
       diy_data.each do |diy|
           Diy.create(
               name: diy["name"],
               url: diy["url"],
               image_url: diy["image_url"],
               recipes_to_unlock: diy["recipes_to_unlock"],
               materials_diy: diy["materials"]
           )
       end
