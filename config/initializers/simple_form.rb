# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  # Wrappers are used by the form builder to generate a
  # complete input. You can remove any component from the
  # wrapper, change the order or even add your own to the
  # stack. The options given below are used to wrap the
  # whole input.
  config.wrappers :default,
                  class: :input,
                  hint_class: :field_with_hint,
                  error_class: :field_with_errors
                  do |b|

    b.use :html5

    b.use :placeholder

    b.optional :maxlength

    b.optional :pattern

    b.optional :min_max

    b.optional :readonly

    b.use :label_input
    b.use :hint,  wrap_with: { tag: :span, class: :hint }
    b.use :error, wrap_with: { tag: :span, class: :error }

  end

  config.default_wrapper = :default

  config.boolean_style = :nested

  config.button_class = 'btn'

  config.error_notification_tag = :div

  config.error_notification_class = 'error_notification'

  config.browser_validations = false

  config.boolean_label_class = 'checkbox'

end
