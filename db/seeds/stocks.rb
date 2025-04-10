print "========"
print "生成测试用药店库存..."
print "========\n\n"

Store.all.each_with_index do |store, index|
  print index.to_s + "... "
  for i in 1..rand(1..10) do
    store.stocks.create!(
      quantity: rand(99999..999999),
      distribution_quantity: rand(99..99999),
      drug_id: i)
  end
end

puts "成功创建随机药店库存"
