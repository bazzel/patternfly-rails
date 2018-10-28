module PatternFly
  class Icons
    PF_ICONS = {
      ok:       'ok',
      info:     'info',
      warning:  'warning-triangle-o',
      error:    'error-circle-o'
    }

    class << self
      PF_ICONS.each do |k, v|
        define_method(k) do
          "<span class='pficon pficon-#{v}'></span>".html_safe
        end
      end
    end
  end
end
