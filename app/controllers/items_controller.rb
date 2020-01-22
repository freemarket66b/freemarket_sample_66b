class ItemsController < ApplicationController

def index
  
  @ladies = Item.where(category_id: 1).limit(10).order("created_at DESC")
  @mens = Item.where(category_id: 200).limit(10).order("created_at DESC")
  @appliances = Item.where(category_id: 898).limit(10).order("created_at DESC")
  @toys = Item.where(category_id: 685).limit(10).order("created_at DESC")
  
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

  def edit
    item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update.(item_params)
  end
  
  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
     redirect_to root_path
    end
 end
 
  def buy
  end

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:status,:delivery_type,:postage,:region,:shipping_date,:price,:category_id,:image).merge(saler_id:current_user.id)
  end

end
