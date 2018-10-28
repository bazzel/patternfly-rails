module PatternFly
  class Alert
    ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)
    delegate :flash, :raw, :content_tag, :safe_join, to: :@template

    ICON_CLASSES = {
      success: 'pficon-ok',
      info: 'pficon-info',
      warning: 'pficon-warning-triangle-o',
      danger: 'pficon-error-circle-o'
    }

    attr_reader :options, :template

    def initialize(options, template)
      @options = options
      @template = template
    end

    def render
      flash_messages = []

      flash.each do |type, message|
        # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
        next if message.blank?

        type = type.to_sym
        type = :success if type == :notice
        type = :danger  if type == :alert
        type = :danger  if type == :error
        next unless ALERT_TYPES.include?(type)

        icon_class = ICON_CLASSES[type]

        icon = content_tag(:span, '', class: "pficon #{icon_class}")

        tag_class = options.extract!(:class)[:class]
        tag_options = {
          class: "alert fade in alert-#{type} #{tag_class}"
        }.merge(options)

        Array(message).each do |msg|
          text = content_tag(:div, close_button + icon + msg, tag_options)
          flash_messages << text if msg
        end
      end
      safe_join flash_messages, "\n"
    end

    private

    def close_button
      content_tag(:button, type: 'button', class: 'close', 'data-dismiss' => 'alert') do
        content_tag(:span, '', class: 'pficon pficon-close')
      end
    end
  end
end
