class Product < ActiveRecord::Base
  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 3, maximum: 30 }
end
