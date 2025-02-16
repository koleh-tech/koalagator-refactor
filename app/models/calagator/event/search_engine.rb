# frozen_string_literal: true

module Calagator
  class Event < Calagator::ApplicationRecord
    class SearchEngine
      cattr_accessor(:kind) { :sql }

      def self.search(*args)
        search_engine.search(*args)
      end

      def self.use(kind)
        self.kind = kind
        search_engine.configure if search_engine.respond_to?(:configure)
      end

      def self.score?
        search_engine.score?
      end

      private_class_method

      def self.search_engine
        Sql
      end
    end
  end
end
