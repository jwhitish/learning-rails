require 'Launchy'

# def pomodoro(work_dur, sets, rest_dur,break_site)
#   msg = ''
#   sets.times do
#     puts 'begin!'
#     sleep(work_dur)
#     puts 'rest!'
#     #Launchy.open("http://#{break_site}")
#     sleep(rest_dur)
#   end
#   puts 'Set complete!'
# end

def set_pom_state
  if session[:id] == nil
    session[:id] = rand(1000)
  end
  if session[:curr_set] == nil
    session[:curr_set] = 1
  end
  if session[:sets] == nil
    session[:sets] = 0
  end
  if session[:work_dur] == nil
    session[:work_dur] = 0
  end
  if session[:rest_dur] == nil
    session[:rest_dur] = 0
  end
  if session[:break_site] == nil
    session[:break_site] = "www.google.com"
  end
end

def break_time
  sleep(session[:work_dur].to_i)
  session[:msg] = "REST"
  session[:curr_set] += 1
  #Launchy.open("http://#{session[:break_site]}")
  redirect "/pomodoro"
end

def work_time
  sleep(session[:rest_dur].to_i)
  session[:msg] = "WORK"
  session[:curr_set] += 1
  redirect "/pomodoro"
end
