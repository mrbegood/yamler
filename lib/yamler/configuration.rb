module Yamler
  ModuleSettings = Struct.new(:dir) do
    def initialize
      # directory where you store application YAML configurations
      self.dir = '/'
    end
  end

  def self.configure
    @config = ModuleSettings.new
    yield(@config) if block_given?
    @config
  end

  def self.config
    @config || configure
  end
end