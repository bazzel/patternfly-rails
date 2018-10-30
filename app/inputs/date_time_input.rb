class DateTimeInput < SimpleForm::Inputs::StringInput
  def input_html_classes
    super.push('bootstrap-datepicker')
  end

  private

  def string?
    true
  end
end
