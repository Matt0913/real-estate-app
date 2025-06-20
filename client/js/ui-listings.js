
import { getProperties } from "./api.js";

const grid = document.getElementById("grid");

(async () => {
  try {
    const qs = window.location.search;       
    const data = await getProperties(qs);
    if (!data.length) {
      grid.innerHTML = "<p>No properties found.</p>";
      return;
    }
    grid.innerHTML = data.map(card).join("");
  } catch (err) {
    grid.textContent = err.message;
  }
})();

function card(p) {
  return `
  <article class="card">
    <h3>${p.title}</h3>
    <p>${p.location}</p>
    <strong>R${Number(p.price).toLocaleString()}</strong>
  </article>`;
}
