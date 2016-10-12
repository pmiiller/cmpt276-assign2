json.array!(@trainers) do |trainer|
  json.extract! trainer, :id, :tname, :level
  json.url trainer_url(trainer, format: :json)
end
