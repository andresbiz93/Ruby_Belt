class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A[\w]+@[\w]+\.[\w]+\Z/
  before_save {email.downcase!}
  has_many :entries, dependent: :destroy
  has_many :songs, through: :entries
end
