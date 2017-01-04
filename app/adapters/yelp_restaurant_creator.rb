class YelpRestaurantCreator

  def yelp_restaurant_creator(response)
    response.businesses.each do |bus|
      restaurant = Restaurant.create({
        rest_name: bus.name,
        rating: bus.rating,
        city: bus.location.city,
        address: bus.location.address,
        image_url: bus.image_url,
        website: bus.url
      })
      restaurant.save
    end
  end

end
