class Item < ActiveRecord::Base
  belongs_to :activity

  # def add_items_to_array(item_objects)
  #   item_names = []
  #   item_objects.each { |item| item_names << item.name }
  #   item_names
  # end
end
