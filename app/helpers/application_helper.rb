module ApplicationHelper

  def breadcrumb(action)
    return action.humanize
  end

end
