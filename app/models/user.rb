class User < ApplicationRecord

	  validates :name, format: { without: /\s/ }, uniqueness: true, presence: true, length: { maximum: 10 }, if: :can_validate
	  validates :email, uniqueness: true, presence: true, if: :can_validate, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, if: :can_validate
  	 def can_validate
    	true
  	end

    has_many :requires
    has_many :reviews
    has_many :comments
    has_many :bookfavorites
	has_secure_password

	has_attached_file :user_img, :styles => { :user_index => "250x350>", :user_show => "325x475>" }, :default_url => "default.png"
  	validates_attachment_content_type :user_img, :content_type => /\Aimage\/.*\Z/

end
