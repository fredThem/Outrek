class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  
  def index
    @trips = policy_scope(Trip).order(created_at: :desc)
  end

  def new
    @trip = Trip.new
    authorize @trip
  end

  def create
    @trip = Trip.new(trips_params)
    @trip.finished = false
    @trip.user = current_user
    authorize @trip
    @checklist = Checklist.create(trip: @trip)
    params[:trip][:activity_ids].map do |activity_id|
      if activity_id != ""
        @activity = Activity.find(activity_id)
        relevant_labels = []
        @activity.recommended_item_labels.each do |rec|
          if !relevant_labels.include? rec.label
            relevant_labels << rec.label
            ChecklistItem.create(label: rec.label, checked: rec.label.items != nil, checklist: @checklist)
          end
        end
        @trip_activity = TripActivity.create(trip: @trip, activity: @activity)
      end
    end
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @recommendations = []
    @trip.activities.each do |activity|
      activity.recommended_item_labels.each do |recommendation|
        if !@recommendations.include? recommendation.label
          @recommendations << recommendation.label
        end
      end
    end
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
    params.require(:trip).permit(:destination, :description, :start_date, :end_date, :activity_ids)
  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end
end
