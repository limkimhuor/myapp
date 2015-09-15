module ApplicationHelper
  def flash_class level
    case level
    when :notice then "alert-info"
    when :error then "alert-error"
    when :alert then "alert-warning"
    when :success then "alert-success"
    end
  end

  def full_title pages_title = ""
    base_title = t "titles.header"
    if pages_title.empty?
      base_title
    else
      "#{pages_title} | #{base_title}"
    end
  end

  def flash_message flash_type
    t "flashs.messages.#{flash_type}", model_name: controller_name.classify
  end

  def render_pagination collection
    paginate collection, theme: "twitter-bootstrap-3", pagination_class: "pagination-sm"
  end
end
