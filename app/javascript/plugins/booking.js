import flatpickr from 'flatpickr';
import "flatpickr/dist/flatpickr.min.css"

const toggleDateInputs = function() {
  const startDateInput = document.getElementById('booking_starting_day');
  const endDateInput = document.getElementById('booking_ending_day');

  if (startDateInput && endDateInput) {
    const unvailableDates = JSON.parse(document.querySelector('.container-fluid').dataset.unavailable)

    flatpickr(startDateInput, {
    minDate: 'today',
    dateFormat: 'Y-m-d',
    disable: unvailableDates,
    onChange: function(selectedDates, selectedDate) {
      if (selectedDate === '') {
        endDateInput.disabled = true;
      }
      let minDate = selectedDates[0];
      minDate.setDate(minDate.getDate());
      endDateCalendar.set('minDate', minDate);
      endDateInput.disabled = false;
    }
  });
    const endDateCalendar =
      flatpickr(endDateInput, {
        dateFormat: 'Y-m-d',
        disable: unvailableDates,
        },
      );
  }
};

export { toggleDateInputs }
