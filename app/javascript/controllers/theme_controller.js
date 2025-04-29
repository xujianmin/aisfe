import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = ["icon"]

  initialize() {
    // 初始化时设置主题为暗色。
    const savedTheme = localStorage.getItem('theme') || 'dark'
    document.documentElement.setAttribute('data-bs-theme', savedTheme)
  }

  connect() {
    // 更新图标
    const currentTheme = document.documentElement.getAttribute('data-bs-theme')
    this.updateIcon(currentTheme)
  }

  toggle() {
    const currentTheme = document.documentElement.getAttribute('data-bs-theme')
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark'

    document.documentElement.setAttribute('data-bs-theme', newTheme)
    localStorage.setItem('theme', newTheme)
    this.updateIcon(newTheme)
  }

  updateIcon(theme) {
    if (theme === 'dark') {
      this.iconTarget.className = 'bi bi-sun-fill'
    } else {
      this.iconTarget.className = 'bi bi-moon-fill'
    }
  }
}
