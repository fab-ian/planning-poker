require "rails_helper"

RSpec.describe InvitationMailer, type: :mailer do
  describe "invite" do
    let(:mail) { InvitationMailer.invite('to@example.org', 'Igor Szybki') }

    it "renders the headers" do
      expect(mail.subject).to eq("Invite")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["grafska@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi Igor Szybki")
    end
  end
end
