// // app/assets/javascripts/category_modal.js

// document.addEventListener('DOMContentLoaded', function () {
//   fetch('/categories')
//     .then(response => response.json())
//     .then(categories => {
//       const categorySelect = document.getElementById('category-select');
//       categories.forEach(category => {
//         const option = document.createElement('option');
//         option.value = category;
//         option.text = `${category} (${categories.filter(c => c === category).length} games)`;
//         categorySelect.add(option);
//       });
//     });

//   // Ouvre la modal après avoir chargé les catégories
//   const categoryModal = new bootstrap.Modal(document.getElementById('categoryModal'));
//   categoryModal.show();
// });
