import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "checkbox"]

  connect() {
    console.log("Clerk controller connected")
  }

  toggleResigned(event) {
    event.preventDefault()
    const checkbox = event.target
    const form = checkbox.closest('form')
    
    if (checkbox.checked) {
      if (confirm("是否确认该店员已离职？")) {
        form.requestSubmit()
      } else {
        checkbox.checked = false
      }
    } else {
      if (confirm("是否确认该店员已复职？")) {
        form.requestSubmit()
      } else {
        checkbox.checked = true
      }
    }
  }
} 