import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets =["openingDate", "endingDate"]

  connect() {
    flatpickr(this.openingDateTarget)
    flatpickr(this.endingDateTarget)
  }
}
