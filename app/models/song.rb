class Song < ApplicationRecord
    validates :artist, :title, presence: true
    validates :artist, :title, length: {minimum:2}
    has_many :entries, dependent: :destroy
    has_many :users, through: :entries
    after_initialize :init

    def init
      self.number  ||= 0.0
    end
end
