class Message < ActiveRecord::Base
  belongs_to :user
  #validates :author, presence: true, length: {minimum: 1}
end
