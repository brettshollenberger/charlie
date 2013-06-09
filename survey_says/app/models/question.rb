class Question < ActiveRecord::Base
  attr_accessible :body, :survey_id

  belongs_to :survey
end
