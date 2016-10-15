json.array!(@battles) do |battle|
  json.extract! battle, :id, :tokimon1, :tokimon2, :winner
  json.url battle_url(battle, format: :json)
end
