class Book < ApplicationRecord

  has_many :reviews
  has_many :comments
  has_many :bookfavorites
	belongs_to :category, optional: true

	has_attached_file :book_img, :styles => { :book_index => "250x350>", :book_show => "325x475>" }, :default_url => "assets/default1.jpg"
  validates_attachment_content_type :book_img, :content_type => /\Aimage\/.*\Z/
  
  def self.search(search)
  if search

    where('title LIKE ?', "%#{search}%").order('id DESC')
  else
    order('id DESC') 
  end
  end
  
end
