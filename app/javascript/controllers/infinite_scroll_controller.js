import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = [ 'search', 'entries', 'loading' ]

  connect() {
    this.loadingClass = 'is-hidden'
  }

  scroll() {
    if (this.active) {
      let body = document.body
      let html = document.documentElement

      let height = Math.max(
        body.scrollHeight,
        body.offsetHeight,
        html.clientHeight,
        html.scrollHeight,
        html.offsetHeight
      )

      if (window.pageYOffset >= height - window.innerHeight - 200) {
        this.active = false
        this.loading(true)
        this.submitAjax()
      }
    }
  }

  submit(e) {
    if (e.keyCode === 13 && this.searchTarget.value !== '') {
      this.page = 1
      this.submitAjax()
    }
  }

  submitAjax() {
    let url = ''
    if (this.hasSearchTarget) {
      url = `${this.url}?q=${this.searchTarget.value}&page=${this.page}`
    } else {
      url = `${this.url}?page=${this.page}`
    }

    Rails.ajax({
      url: url,
      type: 'GET',
      dataType: 'json',
      success: ({ entries, next }) => {
        this.loading(false)
        if (this.page === 1) {
          this.entriesTarget.innerHTML = entries
        } else {
          this.entriesTarget.insertAdjacentHTML('beforeend', entries)
        }

        if (next === undefined) {
          this.page++
          this.active = true
        } else if (next) {
          this.active = true
        }
      }
    })
  }

  loading(load) {
    if (load) {
      this.loadingTarget.classList.add(this.loadingClass)
    } else {
      this.loadingTarget.classList.remove(this.loadingClass)
    }
  }

  get url() {
    return this.data.get('url')
  }

  get page() {
    return parseInt(this.data.get('page'))
  }

  set page(value) {
    this.data.set('page', value)
  }

  get active() {
    return this.data.get('active') === 'true'
  }

  set active(value) {
    this.data.set('active', value)
  }
}
