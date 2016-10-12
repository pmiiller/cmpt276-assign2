json.array!(@tokimons) do |tokimon|
  json.extract! tokimon, :id, :name, :weight, :height, :fly, :fight, :fire, :water, :electric, :ice, :total, :trainer_id
  json.url tokimon_url(tokimon, format: :json)
end
