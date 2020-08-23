class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable
end
