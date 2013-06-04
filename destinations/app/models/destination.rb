class Destination < ActiveRecord::Base
  attr_accessible :name, :trip_id
  belongs_to :trip, inverse_of: :destinations
end
