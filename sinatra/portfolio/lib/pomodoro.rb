require 'Launchy'

def pomodoro(work_dur, sets, rest_dur,break_site)
  msg = ''
  sets.times do
    puts 'begin!'
    sleep(work_dur)
    puts 'rest!'
    #Launchy.open("http://#{break_site}")
    sleep(rest_dur)
  end
  puts 'Set complete!'
end

#pomodoro(2,2,2,'www.google.com')