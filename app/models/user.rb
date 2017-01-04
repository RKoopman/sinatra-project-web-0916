class User < ActiveRecord::Base
  has_and_belongs_to_many :restaurants

  def name=(name)
    binding.pry
  end
end
