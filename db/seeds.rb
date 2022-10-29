puts 'seeding users'

user1 = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: '123456', username: 'Jonnie')
user1 = User.create(first_name: 'Alice', last_name: 'Auko', email: 'alice@example.com', password: '123456', username: 'Alice')
user1 = User.create(first_name: 'Ebenezar', last_name: 'Bukosia', email: 'ebenezar@example.com', password: '123456', username: 'ebbe')

puts 'seeding questions'
quiz1 = Question.create(title: "How to enable two step auth", description: "I am logged out of canva and i'm requred to enable two step authentification, any help ", user_id: 2, votes:0)
quiz2 = Question.create(title: "How to deploy rails api in heroku", description: "I need a full guide on how i can deploy my api on heroku", user_id: 1, votes:12)
quiz3 = Question.create(title: "Can't login on canva", description: "When i try to log into canva i get responce account does not exist any help?", user_id: 2, votes:12)
quiz4 = Question.create(title: "Need help on renaming model column on rails ", description: "How can i rename a column on rails ", user_id: 2, votes:54)
quiz5 = Question.create(title: "Cant access linked in learning", description: "Can seem to be able to log into linked in learning", user_id: 2, votes:33)

puts 'seeding bookmarks...'
er =Bookmark.create(user_id:2, question_id:2)
essr =Bookmark.create(user_id:1, question_id:4)
esr =Bookmark.create(user_id:1, question_id:1)
essr =Bookmark.create(user_id:2, question_id:3)
essr =Bookmark.create(user_id:2, question_id:5)


soln1 = Solution.create(question_id: 1, user_id:2, votes: 122, description: 'Here is what you can try...')
soln2 = Solution.create(question_id: 1, user_id:1, votes: 23, description: 'Simple try this..')
soln3 = Solution.create(question_id: 2, user_id:2, votes: 25, description: 'What hav you tried..')
soln4 = Solution.create(question_id: 2, user_id:1, votes: 52, description: 'Helo did you manage...')
soln5 = Solution.create(question_id: 3, user_id:2, votes: 2, description: 'Try this...')

puts "Seeding done!"

