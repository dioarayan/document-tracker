import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="bs-modal"
export default class extends Controller {
  connect() {
    this.modal = new bootstrap.Modal(this.element);
    this.modal.show();
  }

  disconnect() {
    this.modal.hide();
  }

  submitForm(event) {
    this.modal.hide();
  }

  hideBeforeRender(event) {
    if (this.isOpen()) {
      event.preventDefault();
      this.element.addEventListener('hidden.bs.modal', event.detail.resume);
      this.modal.hide();
      console.log(this.modal);
    }
  }

  isOpen() {
    return this.element.classList.contains('show');
  }
}

