class ItemsController < ApplicationController
  def index
    @items = policy_scope(Item).order(created_at: :desc)
  end

  def new
    @item = Item.new
    @labels = Label.all
  end

  def create
    @item = Item.new(items_params)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
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
