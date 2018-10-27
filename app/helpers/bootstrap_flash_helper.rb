module BootstrapFlashHelper
  def bootstrap_flash(options = {})
    PatternFly::Alert.new(options, self).render
  end
end
