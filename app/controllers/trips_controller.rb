class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @trips = policy_scope(Trip).order(created_at: :desc)
    @my_trips = current_user.trips
    @trips.each do |trip|
      trip.invitations.each do |invitation|
        @my_trips << invitation.trip if invitation.user == current_user
      end
    end
    @my_trips = @my_trips.order(:start_date)
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
    @checklist = Checklist.new(trip: @trip)
    params[:trip][:activity_ids].map do |activity_id|
      next unless activity_id != ""
      @activity = Activity.find(activity_id)
      relevant_labels = []
      @activity.recommended_item_labels.each do |rec|
        unless relevant_labels.include? rec.label
          relevant_labels << rec.label
          ChecklistItem.create(label: rec.label, checked: false, checklist: @checklist)
        end
      end
      @trip_activity = TripActivity.create(trip: @trip, activity: @activity)
    end
    if @trip.save && @checklist.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @recommendations = []
    @trip.activities.each do |activity|
      activity.recommended_item_labels.each do |recommendation|
        @recommendations << recommendation.label unless @recommendations.include? recommendation.label
      end
    end
    @users = [@trip.user]
    @trip.invitations.each do |invitation|
      @users << invitation.user
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
    params.require(:trip).permit(:destination, :description, :start_date, :meetup_time, :end_date, :expected_end_time,
                                 :activity_ids)
  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end
end
