require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
  test "sent" do
    @expected.subject = 'ReservationMailer#sent'
    @expected.body    = read_fixture('sent')
    @expected.date    = Time.now

    assert_equal @expected.encoded, ReservationMailer.create_sent(@expected.date).encoded
  end

end
