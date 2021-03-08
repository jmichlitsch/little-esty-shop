class HolidayService < ApiService
  def holiday_data
    repos_endpoint = "https://date.nager.at/Api/v2/NextPublicHolidays/us"
    get_data(repos_endpoint)
  end

  def holidays
    holiday_data[0..2].map do |holiday_data|
      Holiday.new(holiday_data)
    end
  end
end
