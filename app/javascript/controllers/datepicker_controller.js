import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets =["openingDate", "endingDate"]

  connect() {
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

// récupérer dans un tableau de sous tableau toutes les dates ( start & end ) des bookings qui ont le friend_id
// Via la requete Booking.where(friend_id: 4).pluck(:start_date, :end_date)
// Avec le vrai friend Id récupérer des params
// Dans l'action new de booking créer une méthode dans le modèle Booking
// et passer les dates récup en values dans le front de new de booking
// récupérer les values dans le controler stimulus Date Picker
// Pour chaqu'un des sous arrays et les rajouters à date entrée et date de fin
