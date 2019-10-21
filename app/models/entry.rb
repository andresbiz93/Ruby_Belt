class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :song

  after_initialize :init

  def init
    self.number  ||= 1
  end
end
