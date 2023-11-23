import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dynamic-booking-price"
export default class extends Controller {

  static targets = [ 'startTime', 'endTime', 'priceHolder' ];
  static values = { price: Number };

  connect() {
    console.log("Hello")
  }

  updatePrice() {
    console.log("Hello bis");
    const startDate = this.startTimeTarget.value;
    const endDate = this.endTimeTarget.value;

    const days = this.diffInDays(startDate, endDate);

    const totalValue = this.totalValue(days);

    console.log(startDate);
    console.log(endDate);
    console.log(days);
    console.log(totalValue);

    this.setPriceValue(totalValue)
  }

  setPriceValue(value) {
    this.priceHolderTarget.innerText = value
  }

  diffInDays(startDate, endDate) {
    if (startDate && endDate) {
      const diffTime = (Date.parse(endDate) - Date.parse(startDate))
      var days = Math.ceil(diffTime / (1000 * 60 * 60 * 24))
    } else {
      var days = 0
    }
    return days + 1
  }

  totalValue(days) {
    return (days) * this.priceValue
  }
}
