namespace :dummy_data do
  task create: :environment do
    puts "Create dummy data"

    Rake::Task["dummy_data:create_category"].invoke
    Rake::Task["dummy_data:create_product"].invoke
    Rake::Task["dummy_data:create_product_category"].invoke

    puts "Create dummy data successfully"
  end

  task create_category: :environment do
    puts "Next, you should create category"
    5.times do |n|
      name = Faker::Food.dish
      Category.create!(name: name)
    end
    puts "create category successfully!"
  end

  task create_product: :environment do
    50.times do |n|
      name = Faker::Food.sushi
      description = Faker::Food.description
      sale_price = 80 + n
      price = 100 + n
      sale_count= 100 + n
      Product.create! name: name, description: description, price: price, sale_price: sale_price, sale_count: sale_count
    end
    puts "Data seed completed"
  end

  task create_product_category: :environment do
    20.times do |n|
      product = Product.all.to_a.sample
      category = Category.all.to_a.sample
      ProductCategory.create! product: product, category: category
    end
    puts "Data seed completed!"
  end
end
