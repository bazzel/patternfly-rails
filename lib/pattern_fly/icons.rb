module PatternFly
  class Icons
    class << self
      def ok
        "<span class='pficon pficon-ok'></span>".html_safe
      end

      def info
        "<span class='pficon pficon-info'></span>".html_safe
      end

      def warning
        "<span class='pficon pficon-warning-triangle-o'></span>".html_safe
      end

      def error
        "<span class='pficon pficon-error-circle-o'></span>".html_safe
      end
    end
  end
end
