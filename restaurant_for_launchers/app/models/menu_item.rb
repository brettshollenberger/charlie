class MenuItem < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :price_in_cents

  def price_in_dollars
    (price_in_cents.to_f / 100).round(2)
  end
end
