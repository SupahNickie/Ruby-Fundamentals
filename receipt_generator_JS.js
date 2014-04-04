// In the Javascript case, everything has to be accounted for here
EXEMPTED_ITEMS = ["book", "books", "chocolate", "chocolates", "dessert", "desserts", "pill", "pills"]

function receipt_printer(items) {
  var taxes = []
  var line_items = []
  var sales_total = 0
  for (i = 0; i < items.length; i++) {
    var separated_string = items[i].split(" ")
    var quantity = parseInt(separated_string[0])
    var price = parseFloat(separated_string[separated_string.length - 1])
    separated_string.splice(0, 1)
    separated_string.splice(separated_string.length - 1, 1)
    separated_string.splice(separated_string.length - 1, 1)
    var imported = (separated_string.indexOf("imported") !== -1);
    var exempt = checkExemptions(separated_string, EXEMPTED_ITEMS)
    if (exempt) {
      var sales_tax = 0.0
    } else {
      var sales_tax = (quantity * addSalesTax(price))
      taxes.push(sales_tax)
    }
    if (imported) {
      var import_tax = (quantity * roundUp(addImportTax(price)))
      taxes.push(import_tax)
    } else {
      var import_tax = 0.0
    }
    var total_price = parseFloat((quantity * (sales_tax + price + import_tax)).toFixed(2))
    sales_total = sales_total + total_price
    line_items.push(quantity + " " + separated_string.join(" ") + ": " + total_price.toFixed(2))
  }
  var total_tax = taxes.reduce(function(a, b) { return a + b; }, 0)
  for (var i in line_items) { console.log(line_items[i]); }
  console.log("\nSales Taxes: " + total_tax.toFixed(2) + "\nTotal: " + sales_total.toFixed(2) + "\n\n")
}


  function roundUp(cost) {
    return (Math.ceil(cost*20)/20)
  }

  function addImportTax(cost) {
    return (cost * 5/100)
  }

  function addSalesTax(cost) {
    return (cost * 10/100)
  }

  function checkExemptions(separated_string, exempted_items) {
    var match_found = false
    for (j = 0; j < separated_string.length; j++) {
      if ( exempted_items.indexOf(separated_string[j]) !== -1 ) {
        match_found = true
      }
    }
    return match_found
  }

receipt_printer(["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"])
receipt_printer(["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"])
receipt_printer(["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"])
receipt_printer(["4 boxes of chocolates at 5.49", "2 sour-patch kids candies at 0.99", "3 ugly hats at 9.75", "2 imported Swedish desserts at 11.25"])
