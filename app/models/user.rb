class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable

  validates :name, presence: true
end
