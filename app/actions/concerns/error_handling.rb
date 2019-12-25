# frozen_string_literal: true

module ErrorHandling

  def error_code
    @error_code ||= 400
  end

  def errors
    @errors ||= {}
  end

  def success?
    errors.blank?
  end

  def error_messages
    Hash[errors.map do |key, error_object|
      if error_object.respond_to?(:full_messages)
        [key, formatted_error_messages(error_object.full_messages)]
      elsif error_object.is_a?(Hash)
        [key, error_object.values]
      elsif error_object.is_a?(Array) || error_object.is_a?(String)
        [key, error_object]
      end
    end.compact]
  end

  private

  def fail_with_error(error_code, key, reason)
    self.error_code = error_code
    append_error(key, reason)
    nil # return nil explictly
  end

  def formatted_error_messages(messages)
    messages.map do |message|
      message.gsub(/.*\^/, '')
    end
  end

  def error_code=(code)
    @error_code = code
  end

  def append_error(key, value)
    if value.is_a?(Hash)
      errors[key] ||= {}
      errors[key].merge!(value)
    else
      errors[key] = value
    end
  end
end
