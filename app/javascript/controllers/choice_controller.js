import { Controller } from "@hotwired/stimulus"
import Rails from '@rails/ujs'
Rails.start()

export default class extends Controller {
    like(event) {
        event.preventDefault()
        const item = event.target.closest(".card")
        const receiver_profile_id = item.querySelector(".profile-id").value

        Rails.ajax({
            url: "/likes",
            type: "POST",
            data: `like[receiver_profile_id]=${receiver_profile_id}`,
            success: (response) => {
                console.log("liked!")
                console.log(response)
                item.remove()
                if(response["match"]) {
                    console.log("It's match!")
                }

            },
            error: (response) => {
                console.log(response);
            }
        });
    }
    dislike(event) {
        event.preventDefault()
        const item = event.target.closest(".card")
        item.remove()
        console.log("disliked!")
    }
}
