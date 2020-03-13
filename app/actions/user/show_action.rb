# frozen_string_literal: true

class User::ShowAction < User::BaseAction
  def perform
    record&.present?
  end
end
