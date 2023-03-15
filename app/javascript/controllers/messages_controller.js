import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    let objDiv = document.getElementById("scroll-chat");
    objDiv.scrollTop = objDiv.scrollHeight;
  }
}
