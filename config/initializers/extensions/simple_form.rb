module PatternFlyStuff
  def translate_error_notification
    "<span class='pficon pficon-error-circle-o'></span>" + super
  end
end

SimpleForm::ErrorNotification.prepend(PatternFlyStuff)
