class ChecklistItemsController < ApplicationController
  before_action :set_checklist_item, only: [:edit, :update, :destroy]
  
  def new
    @trip = Trip.find(params[:trip_id])
    @checklist_item = ChecklistItem.new
    authorize @checklist_item
    @labels = Label.all
  end

  def create
    @checklist_item = ChecklistItem.new(checklist_item_params)
    authorize @checklist_item
    @trip = Trip.find(params[:trip_id])
    @checklist_item.checklist = @trip.checklist
    @checklist_item.checked = false
    if @checklist_item.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end
  
  def import
    @trip = Trip.find(params[:trip_id])
    @checklist_item = ChecklistItem.new
    @checklist_item.checklist = @trip.checklist
    @checklist_item.label = Label.find(params[:label_id])
    @checklist_item.checked = false
    authorize @checklist_item
    if @checklist_item.save
      redirect_to trip_path(@checklist_item.checklist.trip)
    end
  end

  def edit
  end

  def update
    @checklist_item.update(checklist_item_params)
    if @checklist_item.save
      redirect_to trip_path(@checklist_item.checklist.trip)
    else
      render :edit
    end
  end

  def destroy
    @checklist_item.destroy
    redirect_to trip_path(@checklist_item.checklist.trip)
  end

  private

  def checklist_item_params
    params.require(:checklist_item).permit(:detail, :checked, :status, :checklist_id, :label_id)
  end

  def set_checklist_item
    @checklist_item = ChecklistItem.find(params[:id])
    authorize @checklist_item   
  end
end
