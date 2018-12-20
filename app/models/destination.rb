class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def max_likes_destination
    post_with_max_likes = "This destination doesn't have any likes yet."
    count = 0
    self.posts.each do |post|
      if post.likes > count
        post_with_max_likes = post
        count = post.likes
      end
    end
    post_with_max_likes
  end

  def recent_posts
  end

  def av_age
    sum = 0
    count = 1
    array = []
    self.posts.each do |post|
      array << post.blogger
    end
    array.uniq.each do |blogger|
      sum += blogger.age
      count += 1
    end
    average_age = sum / count
  end

end
