json.array!(@clocks) do |clock|
  json.extract! clock, :id
  json.url clock_url(clock, format: :json)
end
