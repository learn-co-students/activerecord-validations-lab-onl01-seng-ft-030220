class Author < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone_number, length: { is: 10 }
  #t.string   "name"
  #t.string   "phone_number"
end
