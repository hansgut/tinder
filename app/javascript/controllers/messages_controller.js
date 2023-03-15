import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="messages"
export default class extends Controller {

  connect() {
    let objDiv = document.getElementById("scroll-chat");
    objDiv.scrollTop = objDiv.scrollHeight;
  }
}
