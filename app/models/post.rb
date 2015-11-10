class Post < ActiveRecord::Base
  has_attached_file :image, styles: { :medium => "640x" }
  validates :image, presence: true
  validates :caption, presence: true, length: { minimum: 3, maximum: 300 }
  validates :user_id, presence: true
  
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
