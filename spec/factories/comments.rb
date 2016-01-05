include RandomData
 

 FactoryGirl.define do
   factory :comment do
     title RandomData.random_sentence
     body RandomData.random_paragraph
     topic
     user
     rank 0.0
   end
 end
 
 