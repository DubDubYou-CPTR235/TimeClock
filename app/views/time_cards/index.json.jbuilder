json.array!(@time_cards) do |time_card|
  json.extract! time_card, :id, :user_id, :task_id, :clocked_in
  json.url time_card_url(time_card, format: :json)
end
