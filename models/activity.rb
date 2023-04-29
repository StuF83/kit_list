class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :items

  def items_array
    @item_list = []
    items.each { |item| @item_list << item.name }
    @item_list
  end

  def activity_in_packing_list?(packing_list)
    packing_list.each_with_index do |activity_array, index|
      return index if name == activity_array.first
    end
    false
  end
end
