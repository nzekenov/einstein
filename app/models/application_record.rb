class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def display_error_messages
    full_messages.join('. ') << '.' if errors.any?
  end
end
