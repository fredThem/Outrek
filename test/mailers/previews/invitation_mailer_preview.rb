# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class InvitationMailerPreview < ActionMailer::Preview
  def invite_email
    @trip = Trip.last
    @invitation = Invitation.create(trip: @trip, user: @trip.user)
    InvitationMailer.with(email: 'pianoquin@gmail.com', invitation: @invitation, owner: @trip.user).invite_email
  end
end
