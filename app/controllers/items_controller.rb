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
    @item = Item.find(params[:id])
    @others = Item.all
  end

  def destroy
    if @product.destroy
      redirect_to myitem_item_path if user_signed_in? && current_user.id == @item.user_id
    else
      render :my_item_detail
    end
  end
  def buy
  end

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:status,:delivery_type,:postage,:region,:shipping_date,:price,:category_id,:image).merge(saler_id:current_user.id)
  end

end
