require 'rspec/its'

require_relative '../lib/symengine'

RSpec.configure do |config|
  config.warnings = true

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = :random
end

# SymEngine classes are clashing with Ruby core classes
# ...but write 10 times in a row SymEngine::Integer.new(...) is tiresome.
# So:

def sym(name)
  SymEngine::Symbol.new(name)
end

def int(val)
  SymEngine::Integer.new(val)
end
