import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["carte", "list", "toggleButton"];

  connect() {
  }

  toggleView() {
    this.carteTarget.classList.toggle('d-none');
    this.listTarget.classList.toggle('d-none');
    if (this.toggleButtonTarget.innerText === 'Show on the Map') {
      this.toggleButtonTarget.innerText = 'Show the List';
    } else {
      this.toggleButtonTarget.innerText = 'Show on the Map';
    }
  }
}
