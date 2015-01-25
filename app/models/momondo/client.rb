require 'savon'
require "active_support/core_ext/hash"
require_relative 'result.rb'
require 'date'


module Momondo
  class Client
    def initialize
      @client = Savon.client(wsdl: "http://www.momondo.com/Momondo.asmx?WSDL")
    end

    def where_to_go(options={})
      leave_date = Date.parse(options[:leave_date])
      results_from(@client.call(:where_to_go, message: {
        mode: 1,
        destIdent: "_1",
        priceFrom: 0,
        ambCat: 0,
        maxCount: 10,
        origCode: options[:leave_from],
        priceTo: options[:max_price],
        departYear: leave_date.year,
        departMonth: leave_date.month
      }))
    end

    private

    def results_from(data)
      data = Hash.from_xml(data.to_s)
      results = data['Envelope']['Body']['WhereToGoResponse']['WhereToGoResult']['WhereToGoResult']
      results.map {|r| Momondo::Result.new(Hash[r.map {|k,v| [k.underscore.to_sym, v]}]) }
    end
  end
end

# client = Momondo::Client.new
# results = client.where_to_go(leave_from: "LAX", max_price: 2000, leave_date: '05/07/2015')

