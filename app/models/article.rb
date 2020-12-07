
class Article < ApplicationRecord
    
  belongs_to :user
  
  has_many :comments, dependent: :destroy
  #has_one_attached :image
  has_many_attached :images
  validates :title, presence: true,
                    length: { minimum: 5 }

   
                      
  end
 