class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  def items_array
    @item_list = []
    items.each { |item| @item_list << item.name }
    @item_list
  end
end
