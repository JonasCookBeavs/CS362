class KitchenSink
  # Don't add new parameters to or change the return type of
  # triangle_area!

  def get_base_height
    print 'Enter base: '
    base = gets.to_i
    print 'Enter height: '
    height = gets.to_i

    return base, height
  end

  def gets_output_string(area)
    "The area is #{area}"
  end

  def output(area)
    puts gets_output_string(area)
  end

  def triangle_area
    base, height = self.get_base_height
    area = 0.5 * base * height
    self.output(area)
  end
end

