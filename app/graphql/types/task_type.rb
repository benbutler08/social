module Types
  class TaskType < Types::BaseObject
  	field :id, ID, null: true
    field :title, String, null: true
    field :description, String, null: true
    field :status, String, null: true
    field :assignment, Types::AssignmentType, null: true
  end
end
