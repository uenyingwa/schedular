# frozen_string_literal: true

module AgendaHandler
  def day_agenda(date_param, mentor)
    day_start = Time.zone.parse(date_param)
    day_end = day_start.end_of_day
    time_range = day_start..day_end
    db_allocations = db_bookings(time_range, mentor)
    (day_start.to_i..day_end.to_i).step(1.hour) do |date|
      date_time = Time.zone.at(date).to_s
      calendar_status = db_allocations.include?({ time: date_time, status: 'Booked'}) ? next : 'Available'
      db_allocations << { time: date_time, status: calendar_status }
    end
    db_allocations
  end

  private

  def db_bookings(time_range, mentor)
    booked_slots = []
    bookings = mentor.appointments.booked(time_range).map(&:begin_at).sort
    bookings.each do |booking|
      booked_slots << { time: booking.to_s, status: 'Booked' }
    end
    booked_slots
  end
end
