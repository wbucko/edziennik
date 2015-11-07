json.array!(@histories) do |history|
  json.extract! history, :id, :temat, :data, :ocena
  json.url history_url(history, format: :json)
end
