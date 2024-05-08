class Blogpost < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

scope :sorted, -> { order(arel_table[:published_at].desc.nulls_last).order(updated_at: :desc) } # Pure ruby for a sql query
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.current) }
  scope :scheduled, -> { where("published_at > ?", Time.current) }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.current
  end

  def scheduled?
    published_at? && published_at > Time.current
  end
end

# Scope and Lamda.
# Scopes are custom queries that you define to retrieve specific sets of records from the database.
# e.g Blogpost.all, Blogpost.draft, Blogpost.published and Blogpost.scheduled.

# Lambda is used to ensure that the code inside the scope is evaluated at the time it is called, not at the time the
# class is loaded
