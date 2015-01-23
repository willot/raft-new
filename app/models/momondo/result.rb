module Momondo
  class Result
    attr_reader :origin, :destination, :month, :year, :depart_time, :return_time,
                :price, :quote_time, :supplier_id, :hotel_rates, :amb_cat

    def initialize(result_data)
      @origin = result_data[:orig_code]
      @destination = result_data[:dest_code]
      @month = result_data[:month].to_i
      @year = result_data[:year].to_i
      @depart_time = DateTime.parse(result_data[:depart_time])
      @return_time = DateTime.parse(result_data[:return_time])
      @price = result_data[:price_eur].to_i
      @quote_time = DateTime.parse(result_data[:quote_time])
      @supplier_id = result_data[:supplier_id]
      @hotel_rates = result_data[:hotel_rates]['int'].map(&:to_i)
      @amb_cat = result_data[:amb_cat].to_i
    end
  end
end
