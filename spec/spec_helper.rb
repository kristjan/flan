$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

Dir['lib/**/*.rb'].each {|f| require f}

RSpec.configure do |config|
end

class TestController
  def self.helper(helper)
    # Pass
  end

  def flash
    @flash ||= {}
  end
end

