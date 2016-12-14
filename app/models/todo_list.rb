class TodoList < ActiveRecord::Base
  has_many :todos, dependent: :destroy

  validates :name, presence: true, length: { maximum: 20 }
end
