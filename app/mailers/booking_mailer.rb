class BookingMailer < ActionMailer::Base
  default from: "chenon.p@gmail.com"

  def booking_confirmation(booking)
    @booking = booking

    mail(
      to:       @booking.user.email,
      subject:  "Hello Mr/Mme #{@booking.user.first_name}, you just have booked for #{@booking.bike.kind} bike, well done"
    )
  end
end
