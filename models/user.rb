class User < ActiveRecord::Base
  has_many :activities
  # attr_accessor :items_to_pack

  # after_initialize :init

  # def init
  #   self.items_to_pack ||= []
  # end

  def add_items_to_pack(activity_name, items)
    activity_array = []
    activity_array << activity_name
    activity_array.concat(items)
  end

  def add_activity(activity)
    Activity.create(name: activity, user: self)
  end
end
