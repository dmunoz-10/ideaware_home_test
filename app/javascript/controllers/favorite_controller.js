import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'heart' ]

  connect() {
  }

  submit() {
    let data = JSON.stringify({
      image: {
        id_unsplash: this.idUnsplash,
        url: this.urlUnsplash
      }
    })

    Rails.ajax({
      url: this.url,
      type: 'POST',
      beforeSend(xhr, options) {
        xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8')
        options.data = data
        return true
      },
      success: ({ action }) => {
        if (action === 'favorite' && !this.heartTarget.classList.contains('liked')) {
          this.heartTarget.classList.add('liked')
          this.heartTarget.classList.remove('not_liked')
        } else if (action === 'unfavorite' && !this.heartTarget.classList.contains('not_liked')) {
          this.heartTarget.classList.add('not_liked')
          this.heartTarget.classList.remove('liked')
        }
      }
    })
  }

  get url() {
    return this.data.get('url')
  }

  get idUnsplash() {
    return this.data.get('idUnsplash')
  }

  get urlUnsplash() {
    return this.data.get('urlUnsplash')
  }
}
