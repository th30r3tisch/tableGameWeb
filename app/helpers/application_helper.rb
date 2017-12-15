module ApplicationHelper
  def searchPath()
    games_path if request.path_info.include?('games') else
    events_path if request.path_info.include?('events')
  end
end
