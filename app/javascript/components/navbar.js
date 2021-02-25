const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector(".navbar-lewagon");
  const navItems = document.querySelectorAll(".nav-link");
  if (navbar) {
    window.addEventListener("scroll", () => {
      if (window.scrollY >= window.innerHeight) {
        navbar.classList.add("navbar-lewagon-white");
      } else {
        navbar.classList.remove("navbar-lewagon-white");
      }
    });
  }
};

export { initUpdateNavbarOnScroll };
