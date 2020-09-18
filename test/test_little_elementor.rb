require 'minitest/autorun'
require_relative '../lib/little_elementor'

class LittleElementorTest < Minitest::Test
  def test_h
    h = LittleElementor::Element.new(atomic_number: 1)
    assert_equal h.atomic_number, 1
    assert_equal h.fake_atomic_number, 1
    assert_equal h.charge, 0
    assert_equal h.group, 1
    assert_equal h.period, 1
    assert_equal h.is_nobel_gas, false
    assert_equal h.symbol, "H"
    assert_equal h.name, "hydrogen"
    assert_equal h.electron_configuration(sorted: false).map(&:to_s) === h.electron_configuration.map(&:to_s), true
    assert_equal h.electron_configuration(sorted: false).map(&:to_s), ["1S1"]
  end

  def test_h_with_sym
    h = LittleElementor::Element.new(symbol: "H")
    assert_equal h.atomic_number, 1
    assert_equal h.fake_atomic_number, 1
    assert_equal h.charge, 0
    assert_equal h.group, 1
    assert_equal h.period, 1
    assert_equal h.is_nobel_gas, false
    assert_equal h.symbol, "H"
    assert_equal h.name, "hydrogen"
    assert_equal h.electron_configuration(sorted: false).map(&:to_s) === h.electron_configuration.map(&:to_s), true
    assert_equal h.electron_configuration(sorted: false).map(&:to_s), ["1S1"]
  end

  def test_he_with_sym_and_charge
    h = LittleElementor::Element.new(symbol: "He", charge: -1)
    assert_equal h.atomic_number, 2
    assert_equal h.fake_atomic_number, 1
    assert_equal h.charge, -1
    assert_equal h.group, 18
    assert_equal h.period, 1
    assert_equal h.is_nobel_gas, true
    assert_equal h.symbol, "He"
    assert_equal h.name, "helium"
    assert_equal h.electron_configuration(sorted: false).map(&:to_s) === h.electron_configuration.map(&:to_s), true
    assert_equal h.electron_configuration(sorted: false).map(&:to_s), ["1S2"]
  end

  def test_cr
    cr = LittleElementor::Element.new(atomic_number: 25, charge: -1)
    assert_equal cr.atomic_number, 24
    assert_equal cr.fake_atomic_number, 25
    assert_equal cr.charge, -1
    assert_equal cr.is_nobel_gas, false
    assert_equal cr.symbol, "Cr"
    assert_equal cr.name, "chromium"
    assert_equal cr.electron_configuration.map(&:to_s), ["1S2", "2S2", "2P6", "3S2", "3P6", "3D5", "4S1"]
  end
end
