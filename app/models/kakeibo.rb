class Kakeibo < ApplicationRecord
    before_save :set_date_format
  
    private 
    def set_date_format
      #所得した記帳年月から年、月、日に分割して登録する
      format_date = self.kicho_date.strftime('%Y%m%d')
      self.kicho_year = format_date[0,4]
      self.kicho_month = format_date[4,2]
      self.kicho_day = format_date[6,2]
      end
  end
