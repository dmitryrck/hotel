module CalendarHelper
  def calendar_render
    year = Date.today.year
    month = Date.today.month

    first = Date.civil(year, month)
    last = Date.civil(year, month, -1)

    return_string = "<h1>Em #{month}-#{year}</h1>"
    (first..last).each do |day|
      return_string << day.day.to_s unless Reserva.all(:conditions => ['data = ?', day]).size.zero?
    end
    return_string
  end
end
