module ApplicationHelper
  def sortable(column, title=nil, id)
    title ||= column.titleize
    link_to title, {:sort_by => column}, {:id => id}
 end
end
