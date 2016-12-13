require "yaml"
require "erb"

module Yamler
  class Reader
    attr_reader :data
    
    def initialize(filepath)
      @data = YAML.load(parse_file(filepath)).try(:with_indifferent_access)
    end
    
    def [](key)
      @data.try("[]", key)
    end
    
    def fetch(*args, &block)
      args.flatten.inject(data.dup) do |hsh, key|
        hsh.try("[]", key)
      end
    end
    
    private 
    
    def parse_file(filepath)
      erb = ERB.new(File.read(filepath))
      erb.result(binding)
    end
    
  end
end