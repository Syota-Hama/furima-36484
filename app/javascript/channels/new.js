window.addEventListener('load', function() {
  
  const textField = document.getElementById("item-price")
  const taxPrice = document.getElementById("add-tax-price");
  const profitValue = document.getElementById("profit")

  textField.addEventListener('input', function() {
    const inputValue = textField.value;
    const commission = Math.trunc(inputValue / 10);
    const profit = (inputValue - commission);

    taxPrice.innerHTML = commission;
    profitValue.innerHTML = profit;

  })
});

