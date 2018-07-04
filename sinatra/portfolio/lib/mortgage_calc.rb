def mortgage_calc(dnpmt = 0, principle, rate, period)
  fin_amt = principle - dnpmt
  annual_rate = rate / 100.000
  monthly_rate = annual_rate / 12.000
  period = period * 12.000
  top = monthly_rate * (1.000 + monthly_rate) ** period
  bottom = (( 1.000 + monthly_rate ) ** period) - 1.000
  m = fin_amt * (top / bottom)
  m.round(2)
end
