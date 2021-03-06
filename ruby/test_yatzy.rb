require_relative 'yatzy'
require 'test/unit'

class YatzyTest < Test::Unit::TestCase
  def test_chance_scores_sum_of_all_dice
    expected = 15
    actual = Yatzy.new(2,3,4,5,1).chance
    assert_equal expected , actual
    assert_equal 16 , Yatzy.new(3,3,4,5,1).chance
  end

  def test_yatzy_scores_50
    expected = 50
    actual = Yatzy.new(4,4,4,4,4).yatzy
    assert_equal expected , actual
    assert_equal 50 , Yatzy.new(6,6,6,6,6).yatzy
    assert_equal 0 , Yatzy.new(6,6,6,6,3).yatzy
  end

  def test_1s
    assert_equal Yatzy.new(1,2,3,4,5).ones , 1
    assert_equal 2 , Yatzy.new(1,2,1,4,5).ones
    assert_equal 0 , Yatzy.new(6,2,2,4,5).ones
    assert_equal 4 , Yatzy.new(1,2,1,1,1).ones
  end

  def test_2s
    assert_equal Yatzy.new(1,2,3,2,6).twos , 4
    assert_equal Yatzy.new(2,2,2,2,2).twos , 10
  end

  def test_threes
    assert_equal 6 , Yatzy.new(1,2,3,2,3).threes
    assert_equal 12 , Yatzy.new(2,3,3,3,3).threes
  end

  def test_fours_test
    assert_equal 12 , Yatzy.new(4,4,4,5,5).fours
    assert_equal 8 , Yatzy.new(4,4,5,5,5).fours
    assert_equal 4 , Yatzy.new(4,5,5,5,5).fours
  end

  def test_fives()
    assert_equal 10 , Yatzy.new(4,4,4,5,5).fives
    assert_equal 15 , Yatzy.new(4,4,5,5,5).fives
    assert_equal 20 , Yatzy.new(4,5,5,5,5).fives
  end

  def test_sixes_test
    assert_equal 0 , Yatzy.new(4,4,4,5,5).sixes
    assert_equal 6 , Yatzy.new(4,4,6,5,5).sixes
    assert_equal 18 , Yatzy.new(6,5,6,6,5).sixes
  end

  def test_one_pair
    assert_equal 6 , Yatzy.new(3,4,3,5,6).score_pair
    assert_equal 10 , Yatzy.new(5,3,3,3,5).score_pair
    assert_equal 12 , Yatzy.new(5,3,6,6,5).score_pair
  end

  def test_two_Pair
    assert_equal 16, Yatzy.new(3,3,5,4,5).two_pair
    assert_equal 16, Yatzy.new(3,3,5,5,5).two_pair
  end

  def test_three_of_a_kind()
    assert_equal 9 , Yatzy.new(3,3,3,4,5).three_of_a_kind
    assert_equal 15 , Yatzy.new(5,3,5,4,5).three_of_a_kind
    assert_equal 9 , Yatzy.new(3,3,3,3,5).three_of_a_kind
    assert_equal 9 , Yatzy.new(3,3,3,3,3).three_of_a_kind
  end

  def test_four_of_a_knd
    assert_equal 12 , Yatzy.new(3,3,3,3,5).four_of_a_kind
    assert_equal 20 , Yatzy.new(5,5,5,4,5).four_of_a_kind
    assert_equal 12 , Yatzy.new(3,3,3,3,3).four_of_a_kind
  end

  def test_smallStraight()
    assert_equal 15 , Yatzy.new(1,2,3,4,5).small_straight
    assert_equal 15 , Yatzy.new(2,3,4,5,1).small_straight
    assert_equal 0 , Yatzy.new(1,2,2,4,5).small_straight
  end

  def test_largeStraight
    assert_equal 20 , Yatzy.new(6,2,3,4,5).large_straight
    assert_equal 20 , Yatzy.new(2,3,4,5,6).large_straight
    assert_equal 0 , Yatzy.new(1,2,2,4,5).large_straight
  end

  def test_fullHouse()
    assert_equal 18, Yatzy.new(6,2,2,2,6).fullHouse
    assert_equal 0, Yatzy.new(2,3,4,5,6).fullHouse
  end
end
