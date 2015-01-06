#json.mytasks do
#  json.jm do
# json.id @task.id
# json.name @task.name     
#  json.deadline @task.deadline
#end
#end
json.mytasks do
  json.partial! 'api/v1/tasks/show', task2: @task
end
#json.mytasks @tasks, partial: 'api/v1/tasks/show', as: :task2
#json.total_count @tasks.respond_to?(:total_entries) ?
#@tasks.total_entries : @tasks.to_a.count



