  json.mytasks @tasks, partial: 'api/v1/tasks/show', as: :task2
  json.total_count @tasks.respond_to?(:total_entries) ?
  @tasks.total_entries : @tasks.to_a.count