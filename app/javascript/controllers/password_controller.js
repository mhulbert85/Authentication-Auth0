import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "button"]

  toggle() {
    this.inputType()
    this.buttonText()
  }

  inputType() {
    this.inputTargets.forEach(target => {
      target.type = target.type === 'password' ? 'text' : 'password'
    })
  }

  buttonText() {
    this.buttonTarget.text = this.inputTarget.type === 'password' ? 'show password' : 'hide password'
  }
}
