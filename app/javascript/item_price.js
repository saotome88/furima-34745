function inputPrice() {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {

    const price = itemPrice.value
    const tax = Math.floor(price * 0.1)
    const profit = Math.floor(price - tax)

    const taxPrice = document.getElementById("add-tax-price");
    const profitPrice = document.getElementById("profit");
    taxPrice.innerHTML = tax;
    profitPrice.innerHTML = profit;
  })
};

/* 下記の記述は全てのページで発火するが、functionの中身でkeyupを指定している */
window.addEventListener('load', inputPrice);