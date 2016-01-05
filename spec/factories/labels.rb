include RandomData
 

 FactoryGirl.define do
   factory :label do
     label RandomData.random_word
     title 
     body
     topic
     user
     rank 0.0
   end
 end
 
