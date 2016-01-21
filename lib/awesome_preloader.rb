module AwesomePreloader
  module PreloaderWriter
    extend ActiveSupport::Concern

    included do end

    module ClassMethods
      @@preloaders = {}
      def preloads(method_name, &block)
        if block
          (@@preloaders[self.class.to_s] ||= {}).merge!(method_name => block)
        else
          all.preloads(method_name)
        end
      end

      def preloaders
        @@preloaders[self.class.to_s]
      end
    end
  end

  module Preloader
    def preloads(*method_names)
      klass = self.class.to_s.split('::')[0...-1].join('::').constantize
      method_names.each do |name|
        preload_hash = klass.preloaders[name].call(self)
        self.each do |obj|
          obj.send("#{name}=", preload_hash[obj.id])
        end
      end
      return self
    end
  end

  ActiveRecord::Base.send     :include, PreloaderWriter
  ActiveRecord::Relation.send :include, Preloader
end
