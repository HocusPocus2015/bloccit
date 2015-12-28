class Post < ActiveRecord::Base
  has_many :comments
  @posts.each_with_index { |post, index|
    if index % 5 == 0
        post.title = "SPAM"
    end }
end
