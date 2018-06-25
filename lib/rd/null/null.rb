module Types
  class Null
    def initialize(type = Object)
      @type = type
    end

    def self.of(type)
      @@null_objects ||= {} 
      return @@null_objects[type] if @@null_objects.key?(type)
      @@null_objects[type] = Null.new(type).freeze
    end

    def self.default
      @@default ||= Null.new
    end

    def nil?
      true
    end

    def present?
      false
    end

    def empty?
      true
    end

    def blank?
      true
    end

    def presence
      self
    end

    def method_missing(name, *args, &block)
      raise(
        NoMethodError, 
        "Can't call method #{name} on null object of type #{type}."
      )
    end

    private

    attr_reader :type
  end
end