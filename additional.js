<script>
  document.addEventListener("DOMContentLoaded", function() {
    const items = document.querySelectorAll('.item, .accordion');

    function revealOnScroll() {
      const windowHeight = window.innerHeight * 0.85;

      items.forEach(item => {
        const position = item.getBoundingClientRect().top;
        if (position < windowHeight) {
          item.classList.add('visible');
        }
      });
    }

    window.addEventListener('scroll', revealOnScroll);
    revealOnScroll(); // Check initially
  });
</script>
