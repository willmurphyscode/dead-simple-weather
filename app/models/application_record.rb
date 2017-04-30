class ApplicationRecord # < ActiveRecord::Base
  def self.abstract_class=(*)

  end

  self.abstract_class = true
end
