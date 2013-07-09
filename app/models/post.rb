class Post < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :comments

  def self.search_in_posts word
    Post.where(['title LIKE ? OR content LIKE ?', "%#{word}%", "%#{word}%"])
  end
end
