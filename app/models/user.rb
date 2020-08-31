# frozen_string_literal: true

# Users that manage beers
class User < ApplicationRecord
  has_one_attached :avatar
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :trackable

  validates :name, presence: true

  protected

  def extract_ip_from(request)
    request.headers['X-Forwarded-For'].present? ? request.headers['X-Forwarded-For'] : request.remote_ip
  end
end
