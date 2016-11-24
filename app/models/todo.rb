class Todo < ActiveRecord::Base
  belongs_to :todo_list

  validates :todo_list_id, presence: true
  validates :description, presence: true, length: { maximum: 255 }
  validates :done, inclusion: { in: [true, false]}
end
