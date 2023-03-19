import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="append-message"
export default class extends Controller {
  connect() {
    this.observer = new MutationObserver(this.handleAppend.bind(this));
    this.observer.observe(document.body, { childList: true, subtree: true })
  }
  handleAppend(mutations) {
    mutations.forEach((mutation) => {
      if (mutation.type === "childList" && mutation.addedNodes.length > 0) {
        let objDiv = document.getElementById("scroll-chat");
        objDiv.scrollTop = objDiv.scrollHeight;
      }
    });
  }
}
