class Blogpost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }
end

# Scope and Lamda.
# Scopes are custom queries that you define to retrieve specific sets of records from the database.
# e.g Blogpost.all, Blogpost.draft, Blogpost.published and Blogpost.scheduled.

# Lambda is used to ensure that the code inside the scope is evaluated at the time it is called, not at the time the
# class is loaded
