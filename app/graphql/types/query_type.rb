module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :assignment, AssignmentType, null: true do 
      description "Find an assignment by ID"
      argument :id, ID, required: true
    end

    field :assignments, [AssignmentType], null: false 

    field :tasks, [TaskType], null: false

    def tasks
      Task.all
    end

    def assignment(id:)
      Assignment.find(id)
    end

    def assignments
      Assignment.all
    end 

  end
end
