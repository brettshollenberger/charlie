class Spotting < ActiveRecord::Base
  attr_accessible :bird_name, :location, :spotted_by
#
  validates :bird_name, :location, :spotted_by, :presence => true

  def self.spottings(options={})
    return where(options).count if !options.empty?
    return count
  end

  def self.commonality(bird)
    return self.where(bird_name: bird).count.to_f / count
  end
end
