require "http/server"

# https://cloud.google.com/run/docs/container-contract
#
# The container instance then receives a SIGTERM signal indicating 
# the start of a 10 second period before being shut down 
# (with a SIGKILL signal).
# If the container instance does not catch the SIGTERM signal, 
# it is immediately shut down.

# Handle Ctrl+C (SIGTERM) and kill (SIGKILL) signal.
Signal::INT.trap  { puts "Caught Ctrl+C..."; exit }
Signal::TERM.trap { puts "Caught kill..."; exit }

server = HTTP::Server.new do |context|
  context.response.content_type = "text/plain"
  context.response.print "Hello world! The time is #{Time.local}"
end

# Must bind to "0.0.0.0" for Docker Container to work properly.
address = server.bind_tcp("0.0.0.0", 8080, true)
puts "Listening on http://#{address}"
server.listen
