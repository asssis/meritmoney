json.extract! donation, :id, :value, :reason, :reference, :created_at, :updated_at
json.url donation_url(donation, format: :json)
