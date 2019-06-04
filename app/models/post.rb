class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait?
  
  private
  
  clickbait = [
    "Won't Believe",
    "Secret",
    "Top",
    "Guess"
    ]
    
  def clickbait?
    return false if clickbait.each do |i|
      i.match self.title 
    end
    
    return true 
  end
end
