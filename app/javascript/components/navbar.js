const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector(".navbar-lewagon");
  const navItems = document.querySelectorAll(".nav-link")
  let pathname = window.location.pathname;
    if (navbar) {
      if (pathname === "/") {
        window.addEventListener("scroll", () => {
          if (window.scrollY >= window.innerHeight - 50) {
            navbar.classList.add("navbar-lewagon-white");
            navItems.forEach((item) => {
              item.classList.remove("nav-hidden");
            });
          } else {
            navbar.classList.remove("navbar-lewagon-white");
            navItems.forEach((item) => {
              item.classList.add("nav-hidden");
            });
          }
        });
      } else {
          navbar.classList.add("navbar-lewagon-white");
      }
    }
};

export { initUpdateNavbarOnScroll };
