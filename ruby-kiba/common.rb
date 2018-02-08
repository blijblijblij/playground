# frozen_string_literal: true

require 'awesome_print'
require 'csv'
require 'facets/kernel/blank'

class CsvSource
  def initialize(file, options)
    @file = file
    @options = options
  end

  def each
    CSV.foreach(@file, @options) do |row|
      yield row.to_hash
    end
  end
end

def show_me!
  transform do |row|
    ap row
    row # always return the row to keep it in the pipeline
  end
end

class ParseFrenchDate
  def initialize(from:, to:)
    @from = from
    @to = to
  end

  def process(row)
    row[@to] = Date.strptime(row[@from], '%d/%m/%Y').to_s
    row
  end
end

class RenameField
  def initialize(from:, to:)
    @from = from
    @to = to
  end

  def process(row)
    row[@to] = row.delete(@from)
    row
  end
end

class VerifyFieldsPresence
  def initialize(expected_fields)
    @expected_fields = expected_fields
  end

  def process(row)
    @expected_fields.each do |field|
      if row[field].blank?
        raise "Row lacks value for field #{field} - #{row.inspect}"
      end
    end
    row
  end
end

class CsvDestination
  def initialize(file, output_fields)
    @csv = CSV.open(file, 'w')
    @output_fields = output_fields

    @csv << @output_fields
  end

  def write(row)
    verify_row!(row)
    @csv << row.values_at(*@output_fields) #*
  end

  def verify_row!(row)
    missing_fields = @output_fields - [row.keys & @output_fields].flatten

    if missing_fields.size > 0
      raise "Row lacks required field(s) #{missing_fields}\n#{row}"
    end
  end

  def close
    @csv.close
  end
end
