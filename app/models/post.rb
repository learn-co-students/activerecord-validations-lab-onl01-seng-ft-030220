class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :is_clickbait
  
  def is_clickbait
    clickbait = [".*Won't Believe.*", ".*Secret.*", ".*Top \\d+.*", ".*Guess.*"]
    if !clickbait.any? {|bait| self.title && self.title.match?(bait)}
      self.errors.add(:title, "is clickbait")
    end
  end
end
