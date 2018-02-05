module EventsHelper
  include ApplicationHelper

  def canParticipate
    if (@event.max_participants == nil || @event.admins.length < @event.max_participants) && !canLeave
      true
    else
      false
    end
  end

  def canLeave
    if @event.admins.exists?(current_admin.id)
      true
    else
      false
    end
  end

  def isOrganizer(event)
    if event.organizer == current_admin
      true
    else
      false
    end
  end
end
