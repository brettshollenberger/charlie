class Issue < ActiveRecord::Base
  attr_accessible :category_id, :description, :is_reproducible,
    :severity, :title

  belongs_to :category,
    inverse_of: :issues

  def self.categories
    [
      'Bug',
      'Feature Request',
      'Customer Service Issue'
    ]
  end

  def self.severities
    [
      'Low',
      'Moderate',
      'High'
    ]
  end
end
