class ItemsController < ApplicationController

def index
end


  def new
    @item = Item.new
    @parents = Category.order("id ASC").limit(13)
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    end
  end

  def show
  end

  def buy
  end

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:status,:delivery_type,:postage,:region,:shipping_date,:price,:category).merge(saler_id:current_user.id)
  end

end
