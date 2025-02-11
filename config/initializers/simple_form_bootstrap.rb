SimpleForm.setup do |config|
  config.button_class = "btn"
  config.boolean_label_class = "form-check-label"
  config.label_text = lambda { |label, required, explicit_label| "#{label}" }

  # Vertical forms
  config.wrappers :vertical_form, class: "form-group" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "form-label"
    b.use :input, class: "form-control", error_class: "is-invalid"
    b.use :error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # Vertical select (for dropdowns)
  config.wrappers :vertical_select, class: "form-group" do |b|
    b.use :html5
    b.optional :readonly
    b.use :label, class: "form-label"
    b.use :input, class: "form-select", error_class: "is-invalid"
    b.use :error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # Vertical boolean (checkboxes)
  config.wrappers :vertical_boolean, tag: "div", class: "form-group" do |b|
    b.use :html5
    b.optional :readonly
    b.wrapper tag: "div", class: "form-check" do |ba|
      ba.use :input, class: "form-check-input"
      ba.use :label, class: "form-check-label"
    end
    b.use :error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # Input group wrapper
  config.wrappers :input_group, class: "form-group" do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :minlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: "form-label"
    b.wrapper class: "input-group" do |ba|
      ba.use :input, class: "form-control"
      ba.use :append
    end
    b.use :error, wrap_with: { tag: "div", class: "invalid-feedback" }
    b.use :hint, wrap_with: { tag: "small", class: "form-text text-muted" }
  end

  # Default configuration
  config.default_wrapper = :vertical_form
  config.wrapper_mappings = {
    boolean: :vertical_boolean,
    select: :vertical_select,
    file: :vertical_file,
    radio_buttons: :vertical_radio,
    check_boxes: :vertical_checkboxes,
    datetime: :vertical_multi_select,
    date: :vertical_multi_select,
    time: :vertical_multi_select
  }
end
