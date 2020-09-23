class Post < ApplicationRecord
	 belongs_to :user
	 has_many :post_comments, dependent: :destroy
	 has_many :favorites, dependent: :destroy
	 attachment :image

	  def favorited_by?(user)
	    favorites.where(user_id: user.id).exists?
	  end

	 validates :title, presence: true, length:{in: 1..15}
	 validates :body, presence: true, length: { maximum: 200}
	 validates :image, presence: true
end
