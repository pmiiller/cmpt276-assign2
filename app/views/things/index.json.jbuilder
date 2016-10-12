json.array!(@things) do |thing|
  json.extract! thing, :id, :tname, :description, :person_id
  json.url thing_url(thing, format: :json)
end
