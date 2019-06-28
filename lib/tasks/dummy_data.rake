namespace :dummy_data do
  task create: :environment do
    puts "Create dummy data"

    Rake::Task["dummy_data:create_user"].invoke
    Rake::Task["dummy_data:create_order"].invoke
    Rake::Task["dummy_data:create_category"].invoke
    Rake::Task["dummy_data:create_product"].invoke
    Rake::Task["dummy_data:create_product_category"].invoke
    Rake::Task["dummy_data:create_admin"].invoke
    Rake::Task["dummy_data:create_product_order"].invoke

    puts "Create dummy data successfully"
  end

  task create_user: :environment do
    puts "Next, you should create user"
    1000.times do |n|
      name = Faker::Name.name
      email = Faker::Internet.email
      password= 123456
      created_at= (rand*40).days.ago
      User.create(name: name, email: email, password: password, created_at: created_at)
    end
    puts "create user successfully!"
  end

  task create_order: :environment do
    puts "Next, you should create order"
    500.times do |n|
      user_id = rand(1..100)
      phone = Faker::PhoneNumber.cell_phone
      name = User.find(user_id).name
      email = User.find(user_id).email
      address = Faker::Address.full_address
      created_at = (rand*40).days.ago
      Order.create(name: name, email: email, phone: phone, user_id: user_id, address: address, created_at: created_at)
    end
    puts "create order successfully!"
  end

  task create_category: :environment do
    puts "Next, you should create category"
    50.times do |n|
      name = Faker::Food.dish
      Category.create!(name: name)
    end
    puts "create category successfully!"
  end

  task create_product: :environment do
    puts "Next, you should create product"
    1000.times do |n|
      name = Faker::Food.sushi
      description = Faker::Food.description
      sale_price = 80 + n
      price = 100 + n
      sale_count= 100 + n
      created_at = (rand*40).days.ago
      Product.create! name: name, description: description, price: price, sale_price: sale_price, sale_count: sale_count, created_at: created_at
    end
    puts "create product successfully!"
  end

  task create_product_category: :environment do
    20.times do |n|
      product = Product.all.to_a.sample
      category = Category.all.to_a.sample
      ProductCategory.create! product: product, category: category
    end
    puts "Data seed completed!"
  end

 task create_user: :environment do
  99.times do |n|
    name  = Faker::Name.name
    email = "user-#{n+1}@email.com"
    password = "12345678"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password )
    end
  end

  task create_product_order: :environment do
    500.times do |n|
      order = Order.all.to_a.sample
      product = Product.all.to_a.sample
      quantity = (1..10).to_a.sample
      ProductOrder.create! order: order, product: product, quantity: quantity
    end
    puts "Data seed completed!"
  end

  task create_admin: :environment do
    1.times do |n|
      email = "admin01@gmail.com"
      password = "123456"
      Admin.create! email: email, password: password
    end
    puts "Created Admin success"
  end
end
