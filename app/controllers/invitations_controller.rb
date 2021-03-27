class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:accept, :update, :destroy]

  def new
    @invitation = Invitation.new
    authorize @invitation
  end
  
  def create
    @trip = Trip.find(params[:trip_id])
    @invitation = Invitation.create(invitation_params)
    @invitation.status = "Pending"
  end

  def accept
    participant = current_user
    @invitation.user = participant
  end

  def update
    @invitation.status = params[:status]
  end

  def destroy
    @invitation.destroy
    redirect_to trip_page(@invitation.trip)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end
