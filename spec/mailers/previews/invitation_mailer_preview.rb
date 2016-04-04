# Preview all emails at http://localhost:3000/rails/mailers/invitation_mailer
class InvitationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invitation_mailer/invite
  def invite
    InvitationMailer.invite('to@example.org', 'Igor Szybki', 1, '12345678')
  end

end
