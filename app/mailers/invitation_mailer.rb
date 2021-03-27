class InvitationMailer < ApplicationMailer
  default from: 'invite@outrek.com'

  def invite_email
    @email = params[:email]
    @url = "http://outrek.app/invitation/:id/accept"
    mail(to: @email, subject: 'Please respond to the invitation')
end
