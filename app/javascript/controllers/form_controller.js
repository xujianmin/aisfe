import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  toggleForm() {
    this.formTarget.style.display = this.formTarget.style.display === 'none' ? 'block' : 'none'
  }

  handleSubmit(event) {
    const response = event.detail.fetchResponse
    if (response.succeeded) {
      // 获取表单元素
      const form = this.element.querySelector('form')
      if (form) {
        // 重置表单
        form.reset()
      }
      // 隐藏表单容器
      this.formTarget.style.display = 'none'
    }
  }
} 