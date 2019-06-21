class Input
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def format_data 
    get_input_rows
  end

  def get_input_rows
    data.split("\n").collect(&:strip)
  end
end