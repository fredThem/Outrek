class DutiesController < ApplicationController
  def claim
    @checklist_item = ChecklistItem.find(params[:duty][:checklist_item_id])
    @trip = @checklist_item.checklist.trip
    @user = User.find(params[:duty][:user_id])
    if !@checklist_item.users.include? @user
      @duty = Duty.create(duty_params)
      authorize @duty
      redirect_to trip_path(@trip)
    else
      @duty = @user.duties.find { |duty| duty.checklist_item_id == @checklist_item.id }
      @duty.update(duty_params)
      authorize @duty
      redirect_to trip_path(@trip)
    end
  end

  private
  
  def duty_params
    params.require(:duty).permit(:user_id, :checklist_item_id, :status)
  end
end
