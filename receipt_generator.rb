module ReceiptGenerator
  # Anything can be added here to become exempt (written in singular form)
  EXEMPTED_ITEMS = %w(book chocolate dessert pill)

  def self.receipt_printer(items)
    taxes = Array.new
    line_items = Array.new
    sales_total = 0
    items.each do |string|
      separated_string = string.split(" ")
      quantity, price = separated_string.delete_at(0).to_i, separated_string.delete_at(-1).to_f
      imported = separated_string.include? "imported"
      check_exemptions(separated_string).empty? ? tax_emempt = false : tax_emempt = true
      tax_emempt ? sales_tax = 0.0 : taxes << sales_tax = (quantity * add_sales_tax(price))
      imported ? taxes << import_tax = (quantity * round_up(add_import_tax(price))) : import_tax = 0.0
      total_price = sprintf("%.2f", (quantity * (sales_tax + price + import_tax)))
      sales_total += total_price.to_f
      line_items << "#{quantity} #{separated_string[0..-2].join(" ")}: #{total_price}"
    end
    total_tax = sprintf("%.2f", taxes.reduce(:+))
    sales_total = sprintf("%.2f", sales_total)
    puts line_items
    print "\nSales Taxes: #{total_tax}\nTotal: #{sales_total}\n\n"
  end

  private

  def self.round_up(cost)
    (cost * 20).ceil / 20.0
  end

  def self.add_import_tax(cost)
    (cost * 5/100)
  end

  def self.add_sales_tax(cost)
    (cost * 10/100)
  end

  def self.check_exemptions(separated_string)
    # The secondary check is for the plural form: if user input "chocolates", it will still be caught as exempt (even though "chocolate" is the exempt item)
    separated_string.select {|item| (EXEMPTED_ITEMS.include? item) || (EXEMPTED_ITEMS.include? item[0..-2]) }
  end
end

ReceiptGenerator.receipt_printer(["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"])
ReceiptGenerator.receipt_printer(["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"])
ReceiptGenerator.receipt_printer(["1 imported bottle of perfume at 27.99", "1 bottle of perfume at 18.99", "1 packet of headache pills at 9.75", "1 box of imported chocolates at 11.25"])
ReceiptGenerator.receipt_printer(["4 boxes of chocolates at 5.49", "2 sour-patch kids candies at 0.99", "3 ugly hats at 9.75", "2 imported Swedish desserts at 11.25"])

# OUTPUT:

# 1 book: 12.49
# 1 music CD: 16.49
# 1 chocolate bar: 0.85

# Sales Taxes: 1.50
# Total: 29.83

# 1 imported box of chocolates: 10.50
# 1 imported bottle of perfume: 54.65

# Sales Taxes: 7.65
# Total: 65.15

# 1 imported bottle of perfume: 32.19
# 1 bottle of perfume: 20.89
# 1 packet of headache pills: 9.75
# 1 box of imported chocolates: 11.85

# Sales Taxes: 6.70
# Total: 74.68

# 4 boxes of chocolates: 21.96
# 2 sour-patch kids candies: 2.38
# 3 ugly hats: 38.03
# 2 imported Swedish desserts: 24.90

# Sales Taxes: 4.32
# Total: 87.27
