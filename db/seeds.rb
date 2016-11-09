# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create tags
Tags.create(tag_name:'Vegan',approved:1)
Tags.create(tag_name:'Breakfast',approved:1)
Tags.create(tag_name:'Lunch',approved:1)
Tags.create(tag_name:'Dinner',approved:1)
Tags.create(tag_name:'Desert',approved:1)
Tags.create(tag_name:'Sweet',approved:1)
Tags.create(tag_name:'American',approved:1)
Tags.create(tag_name:'Mexian',approved:1)

# Create admin
User.create(user_name: 'admin', password: 'admin', email: 'admin@admin.com', first_name: 'admin', last_name:'admin', privileges:1)
# Create users
User.create(user_name: 'Extreme112', password: 'askdh', email:'psanjuan06.sj@gmail.com', first_name:'Patrick' , last_name: 'San Juan')
User.create(user_name: 'DongCena', password: 'johncena', email:'invalidEmail@gmail.com', first_name:'John' , last_name: 'Cena')
User.create(user_name: 'Doublelift', password: 'ddlift', email:'pengyilang@gmail.com', first_name:'Peng' , last_name: 'Yilang')
User.create(user_name: 'Batman', password: 'thecave', email:'batbat@wayne.com', first_name:'Bruce' , last_name: 'Wayne')
User.create(user_name: 'Superman', password: 'dailyplanet', email:'clark_kent@dailyplanet.com', first_name:'John' , last_name: 'Cena')

# Create recipes for user

User.find_by_user_name('Extreme112').recipes << Recipe.create(recipe_name: 'Extreme Peperoni Pizza',instructions: '1. Pick up phone 2.Call local pizza store 3. Order peproni pizza 4. Wait 10-20 mins for delivery',complexity:1)
User.find_by_user_name('Extreme112').recipes << Recipe.create(recipe_name: 'Extreme Chocolate Pudding',instructions: '1. Acquire chocolate 2. Acquire vanilla pudding 3.Melt chocolate 4. Combine chocolate and vanilla pudding',complexity:1)

User.find_by_user_name('Batman').recipes << Recipe.create(recipe_name: 'Batmans Chili',instructions: '1. Combine beans and franks red hot sauce 2.Simmer for 30 mins 3. Add beef and simmer for another 30 mins 4.Wait 30 mins before serving',complexity:1)
User.find_by_user_name('Batman').recipes << Recipe.create(recipe_name: 'Batmans Super Cake',instructions: '1. Buy pound cake 2. Buy icing 3. Spread icing over cake',complexity:1)
User.find_by_user_name('Batman').recipes << Recipe.create(recipe_name: 'Batmans Supreme Burger',instructions: '1. buy hamburger from wendys 2. Wait for order',complexity:1)



