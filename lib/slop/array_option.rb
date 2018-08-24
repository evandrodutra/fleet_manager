module Slop
  class ArrayOption < Option
    def finish(opts)
      if self.value.any?
        self.value = value.map { |f| f.to_i }
      end
    end
  end
end
