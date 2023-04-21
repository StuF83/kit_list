class User < ActiveRecord::Base
  has_many :activities
  attr_accessor :items

  after_initialize :set_defaults

  def set_defaults
    self.items ||= []
  end

  def addActivity(activity)
    Activity.create(name: activity, user: self)
  end
end
