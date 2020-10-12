import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'heart' ]

  connect() {
  }

  submit() {
    Rails.ajax({
      url: this.url(),
      type: this.method()
    })
  }

  get url() {
    return this.data.get('url')
  }

  get method() {
    return this.data.get('method')
  }
}
