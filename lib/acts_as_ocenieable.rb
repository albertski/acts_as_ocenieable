require "active_record"
require "active_support/inflector"

module ActsAsOcenieable
  if defined?(ActiveRecord::Base)
    require "acts_as_ocenieable/extenders/ocenieable"
    require "acts_as_ocenieable/ocenie"

    ActiveRecord::Base.extend ActsAsOcenieable::Extenders::Ocenieable
  end

  class Engine < ::Rails::Engine
  end
end
