$(document).ready(function() {
  $('[data-meow-button="create"]').on('submit', function(event) {
    event.preventDefault();
    alert('MEOW!');
  });
});
