class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, numericality: { greater_than: 0 }
  validates :bio, length: {minimum: 30}

  def sum_likes
    count = 0
    max_likes = 'x'
    self.posts.each do |post|
      count = count + post.likes
    end
    count
  end

  def max_likes
    post_with_max_likes = "This blogger doesn't have any likes yet."
    count = 0
    self.posts.each do |post|
      if post.likes > count
        post_with_max_likes = post
        count = post.likes
      end
    end
    post_with_max_likes
  end

end
