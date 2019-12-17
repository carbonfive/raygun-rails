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
end
