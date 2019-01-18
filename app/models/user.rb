class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_voter

  has_many :recipes, dependent: :nullify

  validates :role, presence: true,
                inclusion: { in: ['user', 'admin'] }
end
