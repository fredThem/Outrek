class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new

  end

  def create
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
  end

  def set_item
    @item = Item.find(params[:id])
    authorize @item
  end
end
