import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["startTime", "endTime", "dates"]
  connect() {
    flatpickr(this.datesTarget, {
      mode: "range",
      altInput: true,
      altFormat: 'd/m/Y',
    })
  }
  setDates(){
    let startDate, endDate;
    if (this.datesTarget.value.match(/(\d{4}-\d{2}-\d{2}) to (\d{4}-\d{2}-\d{2})/) !== null) {
      const dateRegex = /(\d{4}-\d{2}-\d{2}) to (\d{4}-\d{2}-\d{2})/;
      const selectedDates = this.datesTarget.value.match(dateRegex);
      startDate = new Date(selectedDates[1]);
      endDate = new Date(selectedDates[2]);
    } else if (this.datesTarget.value.match(/(\d{4}-\d{2}-\d{2})/)  !== null) {
        const dateRegex = /(\d{4}-\d{2}-\d{2})/;
        const selectedDates = this.datesTarget.value.match(dateRegex);
        startDate = new Date(selectedDates[1]);
        endDate = startDate;
    };
    this.startTimeTarget.value = startDate ? startDate.toISOString().split('T')[0] : '';
    this.endTimeTarget.value = endDate ? endDate.toISOString().split('T')[0] : '';
  }
}
