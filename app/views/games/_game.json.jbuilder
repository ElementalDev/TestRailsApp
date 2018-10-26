json.extract! game, :id, :title, :desc, :created_at, :updated_at
json.url game_url(game, format: :json)
