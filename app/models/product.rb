class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description

  validates :name, length: {minimum: 10}
end
