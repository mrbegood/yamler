require "yamler/version"
require "yamler/configuration"
require "yamler/reader"

module Yamler
  def self.read(file, *args, &block)
    hash = Reader.new(File.expand_path(file, config.dir)).fetch(args)
    
    yield(hash) if block_given?
    
    hash
  end
end
