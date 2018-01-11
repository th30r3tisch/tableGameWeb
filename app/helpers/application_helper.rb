module ApplicationHelper
  def searchPath()
    if controller_name == 'events'
      events_path
    else controller_name == 'games'
      games_path
    end
  end
end
