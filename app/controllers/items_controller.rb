class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def index
    @items = policy_scope(Item).order(created_at: :desc)
  end

  def new
    @item = Item.new
    authorize @item
  end

  def create
    @item = Item.new(items_params)
    @item.user = current_user
    @item.label = Label.find(params[:item][:label_id])
    authorize @item
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @item.update(items_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def destroy
    @item.destroy
    redirect_to items_page
  end

  private

  def items_params
    params.require(:item).permit(:name)
  end

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end
end
