require './lib/pattern_fly/icons'

module PatternFly
  class Alert
    PF_ALERT_TYPES = [:success, :info, :warning, :danger]
    delegate :flash, :raw, :content_tag, :safe_join, to: :@template

    ICONS = {
      success: 'ok',
      info: 'info',
      warning: 'warning',
      danger: 'error'
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
        next unless pf_type = pf_type(type)

        tag_class = options.extract!(:class)[:class]
        tag_options = {
          class: "alert fade in alert-#{pf_type} #{tag_class}"
        }.merge(options)
        icon = icon(pf_type)

        Array(message).each do |msg|
          text = content_tag(:div, close_button + icon + msg, tag_options)
          flash_messages << text if msg
        end
      end
      safe_join flash_messages, "\n"
    end

    private

    def close_button
      @close_button ||= begin
                          content_tag(:button, type: 'button', class: 'close', 'data-dismiss' => 'alert') do
                            content_tag(:span, '', class: 'pficon pficon-close')
                          end
                        end
    end

    def icon(type)
      Icons.send(ICONS[type])
    end

    def pf_type(type)
      pf_type = case type.to_sym
                when :notice then :success
                when :alert, :error then :danger
                else type.to_sym
                end

      PF_ALERT_TYPES.include?(pf_type) ? pf_type : nil
    end
  end
end
