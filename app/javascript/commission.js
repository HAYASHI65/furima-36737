function commission (){
  const itemPrice = document.getElementById("item-price")
  itemPrice.addEventListener('keyup',()=>{
    let tax = parseInt(itemPrice.value * 0.1);
    const addTax = document.getElementById("add-tax-price");
    addTax.innerHTML =  tax;

    let prof = (itemPrice.value) - (tax);
    const priceCount = document.getElementById("profit");
    priceCount.innerHTML = prof;
  });
};

window.addEventListener('load',commission);