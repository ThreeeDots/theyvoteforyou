# frozen_string_literal: true

require "spec_helper"

RSpec.describe AlertMailer, type: :mailer do
  describe "policy_updated" do
    # User 1 is the one creating the policy
    let(:user1) { create(:user, name: "Wibble", id: 200) }
    let(:policy) do
      # Manually tell paper trail who made the change. This would normally be done
      # automatically
      PaperTrail.whodunnit = user1.id
      Timecop.freeze(Date.new(2020, 1, 1)) do
        create(:policy, name: "red being a nice colour", id: 50)
      end
    end
    # User 2 is the one being informed of the change
    let(:user2) { create(:user, email: "user2@foo.com", id: 100) }
    let(:mail) { described_class.policy_updated(policy, policy.versions.last, user2) }

    it "renders the headers" do
      expect(mail.subject).to eq("Policy “for red being a nice colour” updated on They Vote For You")
      expect(mail.to).to eq(["user2@foo.com"])
      expect(mail.from).to eq(["contact@theyvoteforyou.org.au"])
    end

    it "has what we expect in the text part of the email" do
      expect(mail.text_part.body.to_s.gsub("\r\n", "\n")).to eq <<~TEXT
        For red being a nice colour
        http://pw.org.au/policies/50

        Created policy “red being a nice colour” with description “there should be fabulous test policies”.

        By Wibble at 12:00AM - 01 Jan 2020
        http://pw.org.au/users/200

        ------------------------------------------------------

        Visit the policy page to unsubscribe from this policy:
        http://pw.org.au/policies/50

        View all your subscriptions:
        http://pw.org.au/users/100/subscriptions
      TEXT
    end

    it "has what we expect in the html part of the email" do
      expect(mail.html_part.body.to_s).to include(
        "Created policy “red being a nice colour” with description “there should be fabulous test policies”."
      )
    end
  end
end
