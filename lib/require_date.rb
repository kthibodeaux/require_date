require 'date'

module RequireDate

  VERSION = '0.0.2'

  ARGUMENT_LIST = ARGV.dup

  FORMATS = {
    :date => Regexp.union(/\A(\d{4})-(\d{2})-(\d{2})\z/, /\A(\d{4})(\d{2})(\d{2})\z/),
    :month_group => Regexp.union(/\A(\d{4})-(\d{2})\z/, /\A(\d{4})(\d{2})\z/)
  }

  def self.next(format = FORMATS[:date], &block)
    ARGUMENT_LIST.each_with_index do |x, i|
      if x[format]
        return_value = x
        ARGUMENT_LIST.delete_at(i)
        return return_value
      end
    end

    if block_given?
      yield block
    else
      raise ArgumentError, "No day remaining to pull from ARGV"
    end
  end

  def self.try_parse(date)
    return date if Date === date
    return Date.parse(date)
  end

end
