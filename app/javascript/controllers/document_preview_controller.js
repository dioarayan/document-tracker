import { Controller } from '@hotwired/stimulus';

// Connects to data-controller="document-modal"
export default class extends Controller {
  connect() {
    console.log('hello!');
  }
}
