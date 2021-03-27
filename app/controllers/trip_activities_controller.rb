class TripActivitiesController < ApplicationController
  def create
    
  end

  private

  def items_params
    params.require(:item).permit(:name, :label)
  end
end
