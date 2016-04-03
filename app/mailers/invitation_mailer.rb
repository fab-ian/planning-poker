class InvitationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitation_mailer.invite.subject
  #
  def invite(email, to_user)
    @greeting = "Hi #{to_user}"

    mail to: email
  end
end
