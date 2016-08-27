class Book < ActiveRecord::Base  
  belongs_to :user  
  mount_uploader :front, FrontUploader
  validates :title, :description, :author, presence: true
  validate  :front_size
  

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

  private
  def front_size
    if front.size > 5.megabytes
      errors.add(:front, "should be less than 5MB")
    end
  end

end
