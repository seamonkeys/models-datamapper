require 'rom'

rom = ROM::Environment.setup() ##)

rom.schema do
  base_relation :seamonkeys do
    repository :yaml

    attribute :id,   Integer
    attribute :name, String
    # TODO support an enum model
    attribute :type, Integer
    attribute :phase, Integer
  end
end