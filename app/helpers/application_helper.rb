module ApplicationHelper
  def searchPath()
    if controller_name == 'events'
      events_path
    else controller_name == 'games'
      games_path
    end
  end

  def isAdmin
    if current_admin && current_admin.role.name == "admin"
      true
    else
      false
    end
  end
end
