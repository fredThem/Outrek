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
    #be mindful with line 16. The invitation actually shouldn't be assigned to the @trip.user, but the object won't create without a user assigned. Unfortunately, to allow user to sign-up after receiving the invitation, the real user assignment has to happen in a different action.
    @invitation.update(status: "Pending")
    authorize @invitation
    if @invitation.save
      InvitationMailer.with(email: params[:invitation][:email], invitation: @invitation, trip: @trip).invite_email.deliver
      redirect_to trip_path(@invitation.trip)
    else
      render :new
    end
  end

  def accept
    @invitation.update(user: current_user, status: "Accepted")
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
