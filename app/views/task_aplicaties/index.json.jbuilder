json.array!(@task_aplicaties) do |task_aplicaty|
  json.extract! task_aplicaty, :id, :title, :description, :completed, :startDate, :endDate
  json.url task_aplicaty_url(task_aplicaty, format: :json)
end
