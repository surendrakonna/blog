# frozen_string_literal: true

module Abstract
  class BaseAction < Uncouple::Action
    include ErrorHandling

    def self.policy_action
      raise NotImplementedError
    end

    def self.permit_keys
      raise NotImplementedError
    end

    def permitted_params
      raise NotImplementedError
    end

    def authorize!
      return if !record

      Pundit.authorize(current_user,
                       record,
                       self.class.policy_action)
    end

    def perform
      @success = save_record! if validate!
    end

    def validate!
      record.present?
    end

    def record
      raise NotImplementedError
    end

    def save_record!
      record.assign_attributes(permitted_params)
      return true if record.save

      fail_with_error(422, self.class.record_type, record.errors)
    end
  end
end
