class Category < ActiveRecord::Base
  attr_accessible :name

  has_many :issues,
    inverse_of: :category,
    dependent: :nullify
end
