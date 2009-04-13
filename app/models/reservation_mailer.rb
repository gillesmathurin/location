class ReservationMailer < ActionMailer::Base
  

  def sent(prospect, house, sent_at = Time.now)
    subject    'Pré-reservation'
    recipients ''
    from       ''
    sent_on    sent_at
    
    body       :prospect => prospect, :house => house
  end

end
