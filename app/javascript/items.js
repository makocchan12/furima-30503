window.addEventListener('DOMContentLoaded', ()=>{
  document.addEventListener('keyup',(e)=>{
    if (e.target == document.getElementById("item-price")){
      const amount = e.target.value;
      const tax = Math.ceil(amount * 0.1);
      const profit = Math.floor(amount * 0.9);
      document.getElementById('add-tax-price').textContent = tax;
      document.getElementById('profit').textContent = profit;
    }
  });
});

