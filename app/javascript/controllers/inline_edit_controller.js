import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="inline-edit"
export default class extends Controller {
  static targets = ["display", "form", "input"]
  static values = {
    url: String
  }

  connect() {
    this.element.addEventListener("click", this.edit.bind(this))
    document.addEventListener("click", this.handleOutsideClick.bind(this))
    this.originalValue = this.displayTarget.textContent.trim()
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
    this.inputTarget.value = this.originalValue
    this.inputTarget.focus
    // this.formTarget.querySelector("input").focus()
  }

  handleOutsideClick(event) {
    // 如果点击的是当前编辑区域，不处理
    if (this.element.contains(event.target)) return
    
    // 如果正在编辑，则取消编辑
    // if (!this.formTarget.classList.contains("d-none")) {
    //   this.cancel()
    // }

    // 如果正在编辑，则检查是否需要保存
    if (!this.formTarget.classList.contains("d-none")) {
      const newValue = this.inputTarget.value.trim()
      if (newValue !== this.originalValue) {
        this.submit()
      } else {
        this.cancel()
      }
    }
  }

  submit(event) {
    if (event) {
      event.preventDefault()
    }
    
    if (!confirm('确定要修改这个值吗？')) {
      return
    }
    
    const form = this.formTarget
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
