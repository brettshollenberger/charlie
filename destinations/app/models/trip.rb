class Trip < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :destinations, :dependent => :destroy, inverse_of: :trip
end
