class Course < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :likes, dependent: :destroy
  has_many :course_domains, dependent: :destroy
  has_many :domains, through: :course_domains
  has_many :course_prereqs, dependent: :destroy
  has_many :prereqs, through: :course_prereqs
  validates :user_id, presence: true
  validates :name, presence: true, length: {minimum:9, maximum: 9 }
  validates :rating, presence: true
  validates :description, presence: true, length: {minimum: 10, maximum: 500 }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  default_scope -> { order(updated_at: :desc) }
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size
  end
  
  private
    def picture_size
      if picture.size > 5.megabytes
        error.add(:picture, 'Should be less than 5 MB')
      end
    end
end