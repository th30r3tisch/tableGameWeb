json.extract! game, :id, :name, :description, :playtime, :maxPlayer, :gameType, :releaseYear, :pictureUrl, :created_at, :updated_at
json.url game_url(game, format: :json)
