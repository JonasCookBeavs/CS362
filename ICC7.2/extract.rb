require 'minitest/autorun'

class Production
  def self.do_antelope_production
    raise "Production is unavailable in testing"
  end
end

class AntelopeClassifier
  def classify(antelope_type)
    # ... lots more code ...
    self.do_production
    # ... lots more code ...
    antelope_type * 698
  end

  def do_production
    Production.do_antelope_production
  end
end

class FakeAntelopeClassifier < AntelopeClassifier
  def do_production

  end
end

class AntelopeClassifierTest < Minitest::Test
  def setup
    @ac = FakeAntelopeClassifier.new
  end

  def test_classify
    assert_equal 3490, @ac.classify(5)
  end
end

