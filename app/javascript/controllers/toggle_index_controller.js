import { Controller } from "@hotwired/stimulus"


// Connects to data-controller="toggle-index"
export default class extends Controller {

  static targets = ["map", "list"];


  connect() {
  }

//   toggleView() {
// console.log(this.Targets)



//     // this.mapContainerTarget.classList.toggle('d-none');
//     // this.listContainerTarget.classList.toggle('d-none');
//     console.log("youre in")
//   }
  }
