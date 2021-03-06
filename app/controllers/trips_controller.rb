require "down"

class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def index
    @trips = policy_scope(Trip).order(:start_date)
    @my_trips = []
    @trips.each do |trip|
      if trip.user == current_user
        @my_trips << trip
      else
        trip.invitations.each do |invitation|
          unless @my_trips.include? trip
            @my_trips << invitation.trip if invitation.user == current_user 
          end
        end
      end  
    end
    @trips_future = @my_trips.select { |trip| trip.start_date > Date.today}
    @trip_next = @trips_future.first
    @trips_future.delete_at(0)
    @trips_past = @my_trips.select { |trip| trip.start_date <= Date.today}
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
    @relevant_labels = []
    params[:trip][:activity_ids].each do |activity_id|
      next unless activity_id != ""
      activity = Activity.find(activity_id)
      activity.recommended_item_labels.first(15).each do |rec|
        unless @relevant_labels.include? rec.label
          @relevant_labels << rec.label
        end
      end
      TripActivity.create(trip: @trip, activity: activity)
    end
    @relevant_labels.each do |relevant_label|
      ChecklistItem.create(label: relevant_label, checked: false, checklist: @checklist)
    end
    if @trip.save && @checklist.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def show
    @recommendations = []
    @past_trip_recommendations = []
    @trip.activities.each do |activity|
      activity.recommended_item_labels.each do |recommendation|
        @recommendations << recommendation.label unless @recommendations.include? recommendation.label
      end
      @trips_past.each do |trip_past|
        if trip_past != @trip
          trip_past.activities.each do |past_activity|
            if activity == past_activity
              trip_past.checklist_items.each do |checklist_item|
                unless @past_trip_recommendations.include? checklist_item.label
                  @past_trip_recommendations << checklist_item.label
                end
              end
            end
          end
        end
      end
    end
    @recommendations.each do |recommendation|
      @recommendations.delete_if { |recommendation| @trip.checklist.labels.include? recommendation }
    end
    @past_trip_recommendations.each do |ptr|
      @past_trip_recommendations.delete_if { |ptr| @trip.checklist.labels.include? ptr }
      @past_trip_recommendations.delete_if { |ptr| @recommendations.include? ptr } 
    end
    @users = []
    @users << @trip.user
    @trip.invitations.each do |invitation|
      @users << invitation.user
    end
    @center = { lat: @trip.latitude, lng: @trip.longitude }.to_json
  end

  def edit
  end

  def update
    @trip.update(trips_params)
    @activities = []
    params[:trip][:activity_ids].each do |activity_id|
      next unless activity_id != ""
      @activity = Activity.find(activity_id)
      @activities << @activity
      unless @trip.activities.include? @activity
        TripActivity.create(trip: @trip, activity: @activity)
      end
    end
    @trip.trip_activities.each do |trip_activity|
      unless @activities.include? trip_activity.activity
        trip_activity.destroy
      end
    end
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path
  end

  private

  def trips_params
    params.require(:trip).permit(:destination, :description, :start_date, :meetup_time, :end_date, :expected_end_time, :activity_ids)
  end

  def set_trip
    @trip = Trip.find(params[:id])
    authorize @trip
  end
end
