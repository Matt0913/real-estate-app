
const BASE = "/api";          

export async function getProperties(query = "") {
  const res = await fetch(`${BASE}/properties${query}`);
  if (!res.ok) throw new Error("Network error");
  return res.json();
}
