import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'heart' ]

  connect() {
    this.classHeart = [ 'liked', 'not_liked' ]
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
        this.classHeart.forEach((item) => {
          this.heartTarget.classList.toggle(item)
        })
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
