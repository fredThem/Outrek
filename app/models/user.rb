class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trips
  has_many :invitations
  has_many :items
  has_many :activities, through: :trips
  has_many :checklists, through: :trips
  has_many :duties
  has_many :checklist_items, through: :duties
  has_one_attached :avatar

  has_person_name
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :avatar, presence: true
end
