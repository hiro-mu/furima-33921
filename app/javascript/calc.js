function calc (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxPrice = document.getElementById("add-tax-price")
    addTaxPrice.innerHTML = Math.floor( inputValue * 0.1 )
    const profitPrice = document.getElementById("profit")
    profitPrice.innerHTML = Math.floor( inputValue - inputValue * 0.1 )
  })
}

window.addEventListener('load', calc);