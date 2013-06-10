class Inquiry < ActiveRecord::Base
  attr_accessible :description, :subject, :user_id

  validates :description, :subject, :user, {
    presence: true
  }

  belongs_to :user, {
    inverse_of: :inquiries
  }

end
