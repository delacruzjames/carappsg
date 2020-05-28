# seed all members data
@emails = %w(
  xxyyzz@gmail.com
  aabbcc@ezy.com.au
  wwyyaa@ntu.edu.sg
  uuttcc@gmail.com
  funnymeh@yahoo.com.sg
  pinkpikachu@buzz.sg
  englishtea@gmail.com
)

@emails.each{|email| Member.where(email: email).first_or_create }


100.times do
  @email = @emails[rand(0..10)]

  if @email.nil?
    puts "creating new application form"
    FactoryBot.create :application_form, email: Faker::Internet.email
  else
    puts "creating new application form with existing members email"
    FactoryBot.create :application_form, email: @email
  end
end
