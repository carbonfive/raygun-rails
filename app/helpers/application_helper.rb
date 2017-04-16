module ApplicationHelper
  # create text with an icon to the left for bootstrap menus and buttons
  def text_with_icon(text, icon_name)
    raw("#{icon(icon_name)} #{text}") # rubocop:disable Rails/OutputSafety
  end

  # generate a standard bootstrap glyphicon
  def icon(name)
    content_tag(:span, nil, class: "glyphicon glyphicon-#{name}")
  end

  # action name to use for the primary submit button on scaffold-created CRUD forms
  def btn_action_prefix
    case action_name
      when "new", "create"
        "Create"
      when "edit", "update"
        "Update"
    end
  end

  # bootstrap icon name to use for the primary submit button on scaffold-created forms
  def action_icon_name
    case action_name
      when "new", "create"
        "plus"
      when "edit", "update"
        "edit"
    end
  end

  def alert_class(alert_type)
    alert_type = {
      alert:  "danger",
      notice: "info"
    }.with_indifferent_access.fetch(alert_type, alert_type.to_s)
    "alert-#{alert_type}"
  end
  def react_component(component_name, props={}, html_options = {}, render_order: 0)
    react_class = 'react__' + component_name.underscore
    base_options = {
      class: react_class,
      "data-react-component": component_name,
      "data-render-order": render_order
    }
    options = props.reduce(base_options) do |memo, (key, value)|
      value = JSON.generate(value) if [Hash, Array].include?(value.class)
      memo.merge("data-#{key}".dasherize => value)
    end
    content_tag(:div, options.merge(html_options)) do
      yield if block_given?
    end
  end

end
