module ApplicationHelper
  # action name to use for the primary submit button on scaffold-created CRUD forms
  def btn_action_prefix
    case action_name
      when "new", "create"
        "Create"
      when "edit", "update"
        "Update"
    end
  end

  def alert_class(alert_type)
    alert_type = {
      alert: "danger",
      notice: "info"
    }.with_indifferent_access.fetch(alert_type, alert_type.to_s)
    "alert-#{alert_type}"
  end
end
