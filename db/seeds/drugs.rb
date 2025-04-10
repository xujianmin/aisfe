drugs_data = YAML.load_file(Rails.root.join('db', 'seeds', 'drugs.yml'))

print "========"
print "生成测试用药品..."
print "========\n\n"

drugs_data['drugs'].each_with_index do |drug_data, index|
  print index.to_s + "... "
  Drug.create!(drug_data)
end

puts "成功创建10个在库药品"
