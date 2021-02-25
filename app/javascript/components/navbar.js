const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector(".navbar-lewagon");
  let pathname = window.location.pathname;
    if (navbar) {
      if (pathname === "/" || pathname === "/about") {
        window.addEventListener("scroll", () => {
        console.log(pathname);
          if (window.scrollY >= window.innerHeight) {
            navbar.classList.add("navbar-lewagon-white");
          } else {
            navbar.classList.remove("navbar-lewagon-white");
          }
        });
      } else {
          navbar.classList.add("navbar-lewagon-white");
      }
    }
};

export { initUpdateNavbarOnScroll };
