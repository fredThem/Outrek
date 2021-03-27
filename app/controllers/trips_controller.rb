class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  
  def index
    @trips = policy_scope(Trip).order(created_at: :desc)
  end

  def new
    @trip = Trip.new
    authorize @trip
    @activities = Activity.all
  end

  def create
    @trip = Trip.new(trips_params)
    authorize @trip
    @activities = params[:activities]
    @trip.activities = @activities
    @checklist = Checklist.create
    @activities.each do |activity|
    relevant_labels = []
      activity.recommended_item_labels.each do |rec|
        if !relevent_labels.include? rec.label
          relevant_labels << rec.label
          @checklist << ChecklistItem.create(label: rec.label, checked: rec.label.items != nil)
        end
      end
    end
    if @trip.save
      redirect_to trip_page(@trip)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @trip.update(trips_params)
    if @trip.save
      redirect_to trip_page(@trip)
    else
      render :new
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_page
  end

  private

  def trips_params
    params.require(:trip).permit(:name)
  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end
end
