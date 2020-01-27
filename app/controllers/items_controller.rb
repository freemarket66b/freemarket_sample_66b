class ItemsController < ApplicationController
  require 'payjp'
  before_action :set_item, only: [:show,:edit,:update,:destroy, :confirmation]

    def index  
      @ladies = Item.where(category_id: 1).limit(10).order("created_at DESC").includes(:images)
      @mens = Item.where(category_id: 200).limit(10).order("created_at DESC").includes(:images)
      @appliances = Item.where(category_id: 898).limit(10).order("created_at DESC").includes(:images)
      @toys = Item.where(category_id: 685).limit(10).order("created_at DESC").includes(:images)
      
    end
  
    def new
      @parent_array = []
      @item = Item.new
      @image  = @item.images.build
      @parents = Category.where(ancestry: nil)
      @parents.each do |parent|
        @parent_array = parent.name
      end
    end
  
  
    def create
      @item = Item.new(item_params)
      if @item.save
        params[:images][:image].each do |image|
          @item.images.create(image: image, item_id: @item_id)
        end
        redirect_to root_path
      else
        render :new
      end
    end
  
    def confirmation
      card = Card.where(user_id: current_user.id).first
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: params['payjp-token'],
        currency: 'jpy',
        customer: card.customer_id
      )
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end


  
    def show
      saler_user = Item.find(params[:id]).saler
      @others = Item.where(saler_id: saler_user).where.not(id: params[:id]).includes(:images).limit(6).order("created_at DESC")
    end
  
    def edit
    end
  
    def update  
      if @item.update(item_params)
        redirect_to root_path
      else 
        render :edit
      end
    end
    
    def buy
    end
  
    def destroy
    if @item.destroy
     redirect_to root_path 
    else 
      render :show
    end
   end
   

    private
  
    def item_params
      params.require(:item).permit(:name,:explanation,:status,:delivery_type,:postage,:region,:shipping_date,:price,:category_id, images_attributes:[:image]).merge(saler_id:current_user.id)
    end
  
    def set_item
      @item = Item.find(params[:id])
    end
  end