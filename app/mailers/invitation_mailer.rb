class InvitationMailer < ApplicationMailer
  default from: 'outrek.app@gmail.com'

  def invite_email
    @email = params[:email]
    @url = "http://localhost:3000/invitations/#{params[:invitation].id}/accept"
    @trip = params[:trip]
    mail(to: @email, subject: "Outreker! You've Been Invited!")
  end
end
