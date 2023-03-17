class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :sufficiently_clickbait_y

  private

  def sufficiently_clickbait_y
    clickbait_phrases = [/Won't Believe/i, /Secret/i, /Top \d+/i, /Guess/i]
    unless clickbait_phrases.any? { |phrase| phrase.match(title) }
      errors.add(:title, "must be sufficiently clickbait-y")
    end
  end
end