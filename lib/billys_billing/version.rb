module BillysBilling
  class Version #:nodoc:
    @major = 1
    @minor = 0
    @tiny  = 2
    @build = nil

    class << self
      attr_reader :major, :minor, :tiny, :build

      def to_s
        [@major, @minor, @tiny, @build].compact.join('.')
      end
    end
  end
end
