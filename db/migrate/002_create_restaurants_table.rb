class CreateRestaurantsTable < ActiveRecord::Migration

  def change
    create_table :restaurants do |t|
      t.string :rest_name
      t.integer :rating
      t.string :address
    end
  end
end
