import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="laugh-log"
export default class extends Controller {
  static targets = ["get"]

  click() {
    console.log('テストボタン動いてる？')
  }
  element_get() {
    const element = this.getTarget
    // const element = document.getElementById('player').getTarget
    console.log(element)
  }
}
