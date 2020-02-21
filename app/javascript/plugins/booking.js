import flatpickr from 'flatpickr';
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const toggleDateInputs = function() {
  const startDateInput = document.getElementById('booking_starting_day');
  const endDateInput = document.getElementById('booking_ending_day');
  console.log(startDateInput);
  console.log(endDateInput);

  if (startDateInput && endDateInput) {
    const unvailableDates = JSON.parse(document.querySelector('.booking_starting_day').dataset.unavailable)

    flatpickr(startDateInput, {
    minDate: 'today',
    dateFormat: 'd-m-Y',
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
        dateFormat: 'd-m-Y',
        disable: unvailableDates,
        },
      );
  }
};

export { toggleDateInputs }
