class BaseController < ApplicationController
  def process_sort(sort)
    puts "process_sort(sort)" + sort
    splitted = sort.split(" ")
    value = '"' + splitted[0] + '"'
    if !splitted[1].nil?
      case splitted[1].downcase
      when "asc"
        value += " asc"
      when "desc"
        value += " desc"
      else
        puts "Command Injection?"
        # splitted.each do |x|
        #   puts x
        # end
      end
    end
    puts "process_sort" + value
    return value
  end
end
