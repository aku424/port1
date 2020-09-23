class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :name, presence: true, length: { in: 2..10 }

         validates :introduction, length:  { maximum: 20}

         has_many :posts, dependent: :destroy
         has_many :post_comments, dependent: :destroy
         has_many :favorites, dependent: :destroy
         attachment :profile_image
end
