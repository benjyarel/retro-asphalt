class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    # TO DO : mettre tout sous if record.id.nill ? Pour proteger
    #   le model de re-regarder les dates quand on update ? voir controller booking/stripe
    bookings = Booking.where(["car_id =?", record.car_id])
    date_ranges = bookings.map { |b| b.starting_day..b.ending_day }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, " #{bookings}")
        record.errors.add(attribute, "La voiture n'est pas disponible sur ces journées #{date_ranges}")
      end
    end
  end

end
