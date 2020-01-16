class ItemsController < ApplicationController

def index
end


  def new
    @item = Item.new
    @parents = Category.order("id ASC").limit(13)
  end


  def create
    @item = Item.new(item_params)
    @item.save
    binding.pry
    if @item.save
      redirect_to root_path
    end
  else
    render "confirmation"
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
    params.require(:item).permit(:name,:explanation,:status,:delivery_type,:postage,:region,:shipping_date,:price,:category_id).merge(saler_id_id:current_user.id)
  end

end
