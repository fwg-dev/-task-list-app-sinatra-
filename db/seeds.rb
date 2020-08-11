#this is where I will write the seed data for my program 

faith = User.create(name: "Faith", email: "faith@gmail.com", password: "pw")

kevin = User.create(name: "Kevin", email: "kevin@gmail.com", password: "pw")

List.create(title: "shopping list", description:"Buy eggs" user_id: faith.id)

List.create(title: "travel packing list", description:"pack jeans" user_id: kevin.id)

# Task.create(description:"Buy eggs", user_id: faith.id)

# Task.create(description:"Elephant Bar",user_id: kevin.id)