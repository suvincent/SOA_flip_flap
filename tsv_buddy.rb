# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    array = tsv.split("\n").map { |line| line.split(/\t/) }
    keys = array.first
    temp = array.drop(1)
    @data = temp.map { |row| keys.zip(row).to_h }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    keys = @data.first.keys
    outputstream = ''
    keys.each { |k| outputstream += k == keys.last ? "#{k}\n" : "#{k}\t" }
    @data.each { |row| row.each { |k, v| outputstream += k == keys.last ? "#{v}\n" : "#{v}\t" } }
    outputstream
  end
end
