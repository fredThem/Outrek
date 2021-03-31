class ChecklistItemsController < ApplicationController
  def create
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
end
