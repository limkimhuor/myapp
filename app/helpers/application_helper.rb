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
    t "flash.messages.#{flash_type}", model_name: controller_name.classify

  end
end
