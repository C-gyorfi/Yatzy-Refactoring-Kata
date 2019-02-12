class Yatzy
  def initialize(*dice)
    @dice = dice
  end

  def chance
    face_values.sum
  end

  def yatzy
    return 50 if unique_face_values.count == 1
    0
  end

  def ones
    check_for_number(1)
  end

  def twos
    check_for_number(2)
  end

  def threes
    check_for_number(3)
  end

  def fours
    check_for_number(4)
  end

  def fives
    check_for_number(5)
  end

  def sixes
    check_for_number(6)
  end

  def two_pair
    sum = 0
    pair_count = 0

    sorted_face_values_that_occur_more_than(2).reverse_each do |num|
      sum += num * 2
      pair_count += 1
    end
    if pair_count == 2
      return sum
    end

    0
  end

  def four_of_a_kind
    check_for_multiple_occurs(4)
  end

  def three_of_a_kind
    check_for_multiple_occurs(3)
  end

  def small_straight
    (face_values & a_small_straight).count == 5 ? 15 : 0
  end

  def large_straight
    (face_values & (2..6).to_a).count == 5 ? 20 : 0
  end

  def fullHouse
    return 0 unless full_house?

    unique_face_values.reduce(0) do |sum, face_value|
      sum + face_value * face_values.count(face_value)
    end
  end

  def score_pair
    sorted_face_values_that_occur_more_than(2).reverse_each do |num|
      return num * 2
    end

    0
  end

  private

  def check_for_number(num)
    sum = 0
    face_values.each do |die|
      if die == num
        sum += die
      end
    end
    sum
  end

  def sorted_face_values_that_occur_more_than(number)
    (1..6).filter { |num| face_values.count(num) >= number }
  end

  def check_for_multiple_occurs(min_occurences)
    sorted_face_values_that_occur_more_than(min_occurences).each do |num|
      return num * min_occurences
    end

    0
  end

  def a_small_straight
    (1..5).to_a
  end

  def face_values
    @dice
  end

  def unique_face_values
    face_values.uniq
  end

  def full_house?
    unique_face_values.count == 2
  end

end
