json.array!(@reports) do |report|
  json.extract! report, :id, :report
  json.url report_url(report, format: :json)
end
