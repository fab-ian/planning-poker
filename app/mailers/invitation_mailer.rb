class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invite.subject
  #
  def invite(email, to_user, invitation_id, password)
    @greeting = "Hi #{to_user}"
    @invitation_id = invitation_id
    @password = password

    mail to: email
  end
end
