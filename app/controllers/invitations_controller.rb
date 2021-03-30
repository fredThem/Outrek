class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:accept, :update, :destroy]

  def new
    @invitation = Invitation.new
    @trip = Trip.find(params[:trip_id])
    @invitation.trip = @trip
    authorize @invitation
  end
  
  def create
    @invitation = Invitation.new(invitation_params)
    @trip = Trip.find(params[:trip_id])
    @invitation.trip = @trip
    #be mindful with line 16. The invitation actually shouldn't be assigned to the current_user, but the object won't create without a user assigned. Unfortunately, to allow user to sign-up after receiving the invitation, the real user assignment has to happen in a different action.
    @invitation.user = current_user
    @invitation.status = "Pending"
    authorize @invitation
    if @invitation.save
      InvitationMailer.with(email: params[:email], owner: @trip.user).invite_email.deliver_later
      redirect_to trip_path(@invitation.trip)
    else
      render :new
    end
  end

  def accept
    @participant = current_user
    @invitation.user = @participant
    @invitation.status = "Accepted"
    if @invitation.save
      redirect_to trip_path(@invitation.trip)
    end
  end

  def update
    @invitation.status = params[:status]
    @invitation.save
  end

  def destroy
    @invitation.destroy
    redirect_to trip_path(@invitation.trip)
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
    authorize @invitation
  end
end
