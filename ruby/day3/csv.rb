class CsvRow
  def initialize headers, row_data
    @headers = headers
    @row_data = row_data
  end

  def method_missing method_name, *args
    index_of_column = @headers.index method_name.to_s
    raise "No column with title '#{method_name}'" unless index_of_column
    @row_data[index_of_column]
  end

end

module ActsAsCsv
  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new filename
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each &block
      @csv_contents.each do |row|  
        cvs_row = CsvRow.new @headers, row
        yield cvs_row, block
      end
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

m.each { |row| puts row.one }
m.each { |row| puts row.two }
m.each { |row| puts row.fred }
