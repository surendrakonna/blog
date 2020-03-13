# frozen_string_literal: true

class User::DestroyAction < User::BaseAction

  def perform
    record&.destroy
  end

end
