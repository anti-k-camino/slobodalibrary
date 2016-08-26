class Book < ActiveRecord::Base
  
  validates :title, :description, :author, presence: true

  def available?
    published_at
  end

  def publish
    update(published_at: DateTime.now)
  end

  def draft
    update(published_at: nil)
  end

  def self.weekly
    where("published_at > ?", DateTime.now - 7)
  end
end
