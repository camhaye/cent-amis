import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets =["openingDate", "endingDate"]

  connect() {
    console.log("coucou")
    console.log(this.openingDateTarget)
    console.log(this.endingDateTarget)
    flatpickr(this.openingDateTarget,
      {
        dateFormat: "Y-m-d",
        disable: [
            {
                from: "2024-02-01",
                to: "2024-02-03"
            },
            {
              from: "2024-02-10",
              to: "2024-02-12"
          }
        ]
      }
    ),
      flatpickr(this.endingDateTarget,
      {
        dateFormat: "Y-m-d",
        disable: [
            {
                from: "2024-02-01",
                to: "2024-02-03"
            },
            {
              from: "2024-02-10",
              to: "2024-02-12"
          }
        ]
      }
    )
  }
}
