module CommentsHelper
  include ApplicationHelper

  def isAuthor (comment)
    if current_admin.id == comment.admin_id
      true
    else
      false
    end
  end
end
