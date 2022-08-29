import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-count"
export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
    console.log("stimulus connected")
    //console.log(this.itemsTarget)
    //console.log(this.formTarget)
  }

  send(event) {
    console.log("send event")
    event.preventDefault()

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        this.formTarget.outerHTML = data.form
      })
  }
}
