class Inquiry < ActiveRecord::Base
  attr_accessible :description, :subject, :user_id

  validates :description, :subject, :user, {
    presence: true
  }

end
