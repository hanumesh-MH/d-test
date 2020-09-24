# frozen_string_literal: true
require 'vine'

def value_from_key(hash, keys)
  hash.access(keys)
end
