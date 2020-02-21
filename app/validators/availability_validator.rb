class AvailabilityValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    # TO DO : un if record.id.nil? pour eviter la validation des dates quand c'est seulement un update
    bookings = Booking.where(["car_id =?", record.car_id])
    date_ranges = bookings.map { |b| b.starting_day..b.ending_day }

    date_ranges.each do |range|
      if range.include? value
        record.errors.add(attribute, "La voiture n'est pas disponible sur ces journées #{date_ranges}")
      end
    end
  end

end
