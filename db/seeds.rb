require 'faker'

# Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all
 
 # Create Posts
 50.times do
   Post.create!(
     user:   users.sample,
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
    # user: users.sample,   # we have not yet associated Users with Comments
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end

  # Questions
10.times do
 Question.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
   )
end

question = Question.all


 
 
user = User.first
 user.skip_reconfirmation!
 user.update_attributes!(
   email: 'berndt.zayne@gmail.com',
   password: 'angus1201'
 )

 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"
 
 

 
