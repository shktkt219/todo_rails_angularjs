class TodoSerializer < ActiveModel::Serializer
  attributes :id, :todo_list_id, :description, :done
end
