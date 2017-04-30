module GewittersHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_gewitters_path
    elsif action_name == 'edit'
      gewitter_path
    end
  end
end
