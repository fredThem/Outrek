class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :trips
  skip_before_action :authenticate_user!, only: :home

  # def home; end

  def trips
    @trips = policy_scope(Trip).order(:start_date)
    if current_user
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
      @trips_future = @my_trips.select { |trip| trip.start_date > Date.today }
      @trip_next = @trips_future.first
      @trips_future.delete_at(0)
      @trips_past = @my_trips.select { |trip| trip.start_date <= Date.today }
    end
    # raise
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
  end

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
