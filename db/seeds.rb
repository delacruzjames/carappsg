# seed all members data
emails = %w(
  xxyyzz@gmail.com
  aabbcc@ezy.com.au
  wwyyaa@ntu.edu.sg
  uuttcc@gmail.com
  funnymeh@yahoo.com.sg
  pinkpikachu@buzz.sg
  englishtea@gmail.com
)

emails.each{|email| Member.create(email: email)}
