class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?
  

  
  CLICKBAIT = [
    "Won't Believe",
    "Secret",
    "Top",
    "Guess"
    ]
  
  def clickbait?
    if clickbait.none? {|i| i.match self.title}
      errors.add(:title, "Not enough clickbait!")
    end
  end

end
