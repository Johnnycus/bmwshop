module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def title(page_title)
    content_for :title, page_title.to_s
  end
end
