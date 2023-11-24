import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stars-in-review-form"
export default class extends Controller {
  connect() {
    this.dynamicRating();
  }


   toggleColorStars(stars, rating) {
    stars.forEach((star) => {
      if (star.id <= rating) {
        star.className = "review-rating fas fa-star"
      } else {
        star.className = "review-rating far fa-star"
      }
    });
  };

  // je créé une fonction qui va récupérer la valeur du rating
  updateRatingInputForm(rating)  {
    const formInput = document.getElementById('review_rating')
    formInput.value = rating
  }

  // je créé une fonction qui va appeler les deux premières fonctions
  dynamicRating() {
    // je récupère toutes les étoiles
    const stars = document.querySelectorAll('.review-rating');
    const starsReview = document.querySelector('#review-star-ratings');


    if ( stars.length > 0) {
      stars.forEach((star) => {
        // au clic je récupère la valeur du rating, j'applique le style css et j'ajoute une classe "selected" sur l'étoile
        star.addEventListener("click", (event) => {
          const rating = event.currentTarget.id
          this.updateRatingInputForm(rating);
          this.toggleColorStars(stars, rating);
          star.classList.add("selected")
        });
        star.addEventListener("mouseover", (event) => {
          // s'il n'y a pas de classe "selected" j'applique du style au passage de la souris
          const rating = event.currentTarget.id
          if (!(document.querySelector(".selected"))) {
            this.toggleColorStars(stars, rating);
          }
        });
      });
      starsReview.addEventListener("mouseout", (event) => {
        if (!(document.querySelector(".selected"))) {
          stars.forEach((star) => {
            star.className = "review-rating far fa-star"
          });
        }
      });
    };
  };

}
