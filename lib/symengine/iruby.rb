if defined?(IRuby)
  module SymEngine
    class Basic
      def to_iruby
        ['text/html', to_s] unless instance_of? Basic
      end
    end
  end
end
