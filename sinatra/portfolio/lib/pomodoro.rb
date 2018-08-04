#require 'Launchy'

def set_pom_state
  if session[:id] == nil
    session[:id] = rand(1000)
  end
  if session[:curr_set] == nil
    session[:curr_set] = 0
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
  if session[:curr_set].to_i >= session[:sets].to_i
    session.clear
    session[:submit] = "End"
    session[:pom_status] = "Stopped"
    session[:msg] = "STOP"
    redirect "/pomodoro"
  else #session in progress
    session[:curr_set] += 1
    #Launchy.open("http://#{session[:break_site]}")
    #sleep(session[:work_dur].to_i)
    #redirect "/pomodoro/work"
  end
end

def work_time
  if session[:curr_set].to_i >= session[:sets].to_i
    session.clear
    session[:submit] = "End"
    session[:pom_status] = "Stopped"
    session[:msg] = "STOP"
    redirect "/pomodoro"
  else #session in progress
    session[:curr_set] += 1
    #sleep(session[:rest_dur].to_i)
    #redirect "/pomodoro/rest"
  end
end
