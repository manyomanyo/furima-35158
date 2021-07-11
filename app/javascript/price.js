window.addEventListener('load', () => {
  const productPrice = document.getElementById("item-price");
  productPrice.addEventListener("input", () => {
    const inputValue = productPrice.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(productPrice.value * 0.1);
    const salesProfit = document.getElementById("profit");
    salesProfit.innerHTML = Math.floor(productPrice.value - addTaxDom.innerHTML);
  })
});