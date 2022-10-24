puts 'seeding users'

user1 = User.create(first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: '123456', username: 'Jonnie')
user1 = User.create(first_name: 'Alice', last_name: 'Auko', email: 'alice@example.com', password: '123456', username: 'Alice')

puts "Creating tags..."
code = Tag.create(name:'student account')
programming = Tag.create(name:'canva')
programmer = Tag.create(name:'heroku')
developer = Tag.create(name:'ruby on rails')
technology= Tag.create(name:'react,js')
ccs3 = Tag.create(name:'space')
angular = Tag.create(name:'angular.js')

puts 'seeding questions'
quiz1 = Question.create(title: "Question 1", description: "This is quiz 1", user_id: 1, votes:0)
quiz2 = Question.create(title: "Question 2", description: "This is quiz 2", user_id: 1, votes:12)
quiz3 = Question.create(title: "Question 3", description: "This is quiz 3", user_id: 2, votes:12)
quiz4 = Question.create(title: "Question 4", description: "This is quiz 4", user_id: 2, votes:54)
quiz5 = Question.create(title: "Question 5", description: "This is quiz 5", user_id: 2, votes:33)
puts "Seeding done!"

