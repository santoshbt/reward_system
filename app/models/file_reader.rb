class FileReader
  attr_reader :path 

  def initialize(path)
    @path = path
  end

  def read_data
    input_array = []
    File.open(path, "r").each do |line|
      input_array << line
    end
    input_array
  end
end