class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders

  validates_presence_of :email, :full_name
  validates :email, uniqueness: true
  validates :display_name, length: { in: 2..32 }, allow_blank: true
  def admin?
    self.admin
  end
end
