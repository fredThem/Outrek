class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  

  has_many :trips, dependent: :destroy
  has_many :invitations, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :activities, through: :trips
  has_many :checklists, through: :trips
  has_many :duties, dependent: :destroy
  has_many :checklist_items, through: :duties

  has_one_attached :avatar
  after_commit :add_default_avatar, on: :create

  has_person_name
  validates :first_name, presence: true
  validates :last_name, presence: true
  # validates :avatar, presence: true

  private 
  
  def add_default_avatar
    unless avatar.attached?
      puts "attaching default user avatar"
      default_avatars = Dir['app/assets/images/avatars-default/*'].size
      avatar.attach(io: File.open(Rails.root.join("app", "assets", "images", "avatars-default", "avatar-critters_#{rand(default_avatars)}.png")),
                   filename: 'default_avatar.jpg', content_type: "image/png")
    end
  end
end
