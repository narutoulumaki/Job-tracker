require "test_helper"

class ReminderMailerrailsMailerTest < ActionMailer::TestCase
  test "generate" do
    mail = ReminderMailerrailsMailer.generate
    assert_equal "Generate", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "mailer" do
    mail = ReminderMailerrailsMailer.mailer
    assert_equal "Mailer", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "ReminderMailer" do
    mail = ReminderMailerrailsMailer.ReminderMailer
    assert_equal "Remindermailer", mail.subject
    assert_equal [ "to@example.org" ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
