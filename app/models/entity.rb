class Entity < ActiveRecord::Base
  default_scope { order(name: :desc) }
end
