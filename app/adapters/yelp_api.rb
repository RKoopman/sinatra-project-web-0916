require 'yelp'

class YelpApi

  def client
    Yelp::Client.new({
      consumer_key: 'MPLSfYb5xV1AaqBo8WlNWw',
      consumer_secret: 'tv_23gXJLbOisSEOtjIocapi4oY',
      token: 'VHm6sjU8PSfADsehRf6nOZVV727mUYmm',
      token_secret: 'CxQsBpCEMC7cvQxh1UpVw_IZzx0'
      })
  end
  

  # def yelp_restaurant_creator(response)
  #   restaurant = Restaurant.create
  #   restaurant.rest_name = response.businesses[0].name
  #   restaurant.rating = response.businesses[0].rating
  #   restaurant.city = response.businesses[0].location.city
  #   restaurant.address = response.businesses[0].location.address
  #   restaurant.image_url = response.businesses[0].image_url
  #   restaurant.website = response.businesses[0].url
  #   restaurant.save
  # end
  # def response
  #   @response = client.search(search, params)
  # end

  # sort 0 = nest match
  # sort 2 = highest rating

end
