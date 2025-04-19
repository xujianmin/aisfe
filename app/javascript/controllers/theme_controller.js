import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="theme"
export default class extends Controller {
  static targets = ["icon"]
  connect() {
    const savedTheme = localStorage.getItem('theme') || 'light'
    document.documentElement.setAttribute('data-bs-theme', savedTheme)
    this.updateIcon(savedTheme)
  }

  toggle() {
    const currentTheme = document.documentElement.getAttribute('data-bs-theme')
    const newTheme = currentTheme === 'light' ? 'dark' : 'light'

    document.documentElement.setAttribute('data-bs-theme', newTheme)
    localStorage.setItem('theme', newTheme)
    this.updateIcon(newTheme)
  }

  updateIcon(theme) {
    if (theme === 'light') {
      this.iconTarget.className = 'bi bi-moon-fill'
    } else {
      this.iconTarget.className = 'bi bi-sun-fill'
    }
  }
}
