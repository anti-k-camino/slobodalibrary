class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable, :trackable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :books, dependent: :destroy

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def author_of? res
    id == res.user_id
  end
end
