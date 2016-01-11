require "yaml"

module Yamler
  class Reader
    attr_reader :data
    
    def initialize(filepath)
      @data = YAML.load(File.read(filepath)).try(:with_indifferent_access)
    end
    
    def [](key)
      @data.try("[]", key)
    end
    
    def fetch(*args, &block)
      args.flatten.inject(data.dup) do |hsh, key|
        hsh.try("[]", key)
      end
    end
  end
end