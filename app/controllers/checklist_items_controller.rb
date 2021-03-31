class ChecklistItemsController < ApplicationController
  def new
    @checklist_item = ChecklistItem.new
    authorize @checklist_item
    @labels = Label.all
  end

  def create
    @checklist_item = ChecklistItem.new(checklist_item_params)
    authorize @checklist_item
    @trip = Trip.find(params[:trip_id])
    @checklist_item.checklist = @trip.checklist
  end
  
  def import
    @trip = Trip.find(params[:trip_id])
    @checklist_item = ChecklistItem.new
    @checklist_item.checklist = @trip.checklist
    @checklist_item.label = Label.find(params[:label_id])
    @checklist_item.checked = false
    authorize @checklist_item
    if @checklist_item.save
      redirect_to trip_path(@trip)
    end
  end

  private

  def checklist_item_params
    params.require(:checklist_item).permit(:detail, :checked, :status, :checklist_id, :trip_id)
  end
end
