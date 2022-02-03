// Entry point for the build script in your package.json

require("@rails/ujs").start()

import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener("turbo:load", function () {
  // Reload feather icons
  if (window.feather) {
    window.feather.replace();
  }
});
