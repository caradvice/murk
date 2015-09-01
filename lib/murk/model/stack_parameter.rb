
module Murk
  module Model

    class SimpleStackParameter

      attr_reader :key, :value, :env

      def initialize(key, value, env: nil)
        @key = key
        @value = value
        @env = env
      end

      def resolve
        @value
      end

      def ==(other)
        @key == other.key && @value == other.value && @env == other.env
      end

    end

    class ReferenceStackParameter

      attr_reader :key, :block

      def initialize(key, block, env: nil, user: nil)
        @key = key
        @block = block
        @user = user
        @env = env
      end

      def resolve
        instance_eval(&@block)
      end

      def stack(name)
        Stack.new(name, env: @env, user: @user)
      end

    end
  end
end
