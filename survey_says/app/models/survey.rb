class Survey < ActiveRecord::Base
  attr_accessible :name

  has_many :questions,
    dependent: :destroy

  accepts_nested_attributes_for :questions

  attr_accessible :questions_attributes
end
