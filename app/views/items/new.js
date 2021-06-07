var value = 300;
var maxNum = 9999999;
var tagInput = document.getElementById("item-price")
var tagOutputTax = document.getElementById("add-tax-price")
var tagOutputProfit = document.getElementById("profit")

tagInput.addEventListener('change', function(){
  var str = this.value;
  var num = Number(str.replace(/[^0-9]/g, ''));
  if(num == 0) {
    num = '';
  } else if (num > macNum) {
    num = macNum;
  }

  this.value = price;
  if(price != 0) {
    tagOutputTax.value = price * 0.1;
    tagOutputProfit.value = price * 0.9
  }
})