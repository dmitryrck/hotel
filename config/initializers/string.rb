class String
  def data_do_br
    (self.include?('/') ? "#{self[6..9]}-#{self[3..4]}-#{self[0..1]}" : self ).to_date
  end
end
