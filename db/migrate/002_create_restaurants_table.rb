class CreateRestaurantsTable < ActiveRecord::Migration

  def change
    create_table :restaurants do |t|
      t.string :rest_name
      t.string :category
      t.integer :rating
      t.string :city
      t.string :address
      t.string :image_url
      t.string :website
    end
  end
end
