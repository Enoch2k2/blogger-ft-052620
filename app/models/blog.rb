class Blog < ApplicationRecord
  belongs_to :user

  scope :published, -> { where.not(published_date: nil) }
  scope :not_published, -> { where(published_date: nil) }
  scope :recent_published_blogs, -> { self.published.where("published_date > ?", 5.days.ago) }
  scope :sorted_published_blogs, -> { self.published.order(published_date: :desc)}
  scope :sorted_non_published_blogs, -> { self.non_published.order(published_date: :desc)}
  scope :search, -> (term) { self.sorted_published_blogs.where("title LIKE ?", "%#{term}%") }

  # def self.published
  #   where.not(published_date: nil)
  # end



  validates_presence_of :title, :content
  validates_uniqueness_of :title

end