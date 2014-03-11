require 'test_helper'

class ModelMailerTest < ActionMailer::TestCase
  test "signal_annonce" do
    mail = ModelMailer.signal_annonce
    assert_equal "Signal annonce", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
