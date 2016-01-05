include RandomData
 

 FactoryGirl.define do
   factory :vote do
     vote rand(1..9)
     topic
     user
     rank 0.0
   end
 end
 
 