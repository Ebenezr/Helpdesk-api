puts "Creating tags..."
code = Tag.create(name:'Code')
programming = Tag.create(name:'Programming')
programmer = Tag.create(name:'Programmer')
developer = Tag.create(name:'Developer')
technology= Tag.create(name:'technology')
ccs3 = Tag.create(name:'CCS3')
angular = Tag.create(name:'Angular')

quiz1 = Quiz.create(title: "Quiz 1", description: "This is quiz 1", user_id: 1, votes:3)
quiz2 = Quiz.create(title: "Quiz 2", description: "This is quiz 2", user_id: 1, votes:3)
quiz3 = Quiz.create(title: "Quiz 3", description: "This is quiz 3", user_id: 1, votes:3)
quiz4 = Quiz.create(title: "Quiz 4", description: "This is quiz 4", user_id: 1, votes:3)
quiz5 = Quiz.create(title: "Quiz 5", description: "This is quiz 5", user_id: 1, votes:3)
puts "Seeding done!"

