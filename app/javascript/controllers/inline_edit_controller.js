import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inline-edit"
export default class extends Controller {
  static targets = ["display", "form"]
  static values = {
    url: String
  }

  connect() {
    this.element.addEventListener("click", this.edit.bind(this))
    document.addEventListener("click", this.handleOutsideClick.bind(this))
  }

  disconnect() {
    this.element.removeEventListener("click", this.edit.bind(this))
    document.removeEventListener("click", this.handleOutsideClick.bind(this))
  }
  
  edit(event) {
    // 如果点击的是表单，不触发编辑
    if (event.target.closest("form")) return

    this.displayTarget.classList.add("d-none")
    this.formTarget.classList.remove("d-none")
    this.formTarget.querySelector("input").focus()
  }

  handleOutsideClick(event) {
    // 如果点击的是当前编辑区域，不处理
    if (this.element.contains(event.target)) return
    
    // 如果正在编辑，则取消编辑
    if (!this.formTarget.classList.contains("d-none")) {
      this.cancel()
    }
  }

  submit(event) {
    event.preventDefault()
    const form = event.target
    const formData = new FormData(form)

    fetch(this.urlValue, {
      method: "PATCH",
      body: formData,
      headers: {
        "X-CSRF-Token": document.querySelector("[name='csrf-token']").content
      }
    })
    .then(response => response.text())
    .then(html => {
      Turbo.renderStreamMessage(html)
      this.cancel()
    })
  }

  cancel() {
    this.displayTarget.classList.remove("d-none")
    this.formTarget.classList.add("d-none")
  }
}
