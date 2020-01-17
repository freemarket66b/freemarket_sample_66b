class ItemsController < ApplicationController

def index
  @items = Item.all
end


  def new
    @parent_array = []
    @item = Item.new
    @parents = Category.where(ancestry: nil)
    @parents.each do |parent|
    @parent_array = parent.name
    end
  end


  def create
    binding.pry
    @item = Item.new(item_params)
    @item.save
    if @item.save
      redirect_to root_path
    end
  end

  def confirmation
    @item = Item.new
  end

  def show
  end

  def buy
  end

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:status,:delivery_type,:postage,:region,:shipping_date,:price,:category_id,:image).merge(saler_id:current_user.id)
  end

end
