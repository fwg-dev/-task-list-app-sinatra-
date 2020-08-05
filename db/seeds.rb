#this is where I will write the seed data for my program 

faith = User.create(email:"faith@gmail.com",password: "pw")

kevin = User.create(email:"kevin@gmail.com",password: "pw")

List.create(title: "shopping list", user_id: faith.id)

List.create(title: "Movie and Tv list", user_id: faith.id)

List.create(title: "travel packing list", user_id: kevin.id)

List.create(title: "Restaurant list", user_id: kevin.id)

Task.create(description:"Buy eggs", user_id: faith.id)

Task.create(description:"Old Guard", user_id: faith.id)

Task.create(description:"Pack jeans", user_id: kevin.id)

Task.create(description:"Elephant Bar",user_id: kevin.id)


#Task.create(description:"Buy eggs",description: "Buy Mangoes", description: "Buy milk" user_id: faith.id)

#Task.create(description:"Old Guard", description:"Black is King", description: "Spencer" user_id: faith.id)

#Task.create(description:"Pack jeans", description:"Pack shirts", description:"Pack toothbrush" user_id: kevin.id)

#Task.create(description:"Elephant Bar", description:"In-and Out", description:"Chick-fil-A" user_id: kevin.id)
