# Description:
#   Lets you specify a default github repo for the current room 
#
# Dependencies:
#   none
#
# Configuration:
#   none
#
# Commands:
#   hubot set default repo <user>/<repo>
#   hubot default repo
#
# Author:
#   willcosgrove

module.exports = (robot) ->
  robot.respond /set default repo (\w+\/\w+)/i, (msg) ->
    if msg.match[1]
      room = msg.room
      robot.brain.data.room_repos ||= {}
      robot.brain.data.room_repos[room] = msg.match[1]
      msg.send "Remembering that #{msg.match[1]} is the default repo for this room"
    else
      msg.send "I didn't quite get that.  Repo names need to be in the following format: <user>/<repo>"

  robot.respond /default repo/, (msg) ->
    console.log msg
    room = msg.room
    console.log room
    repo = robot.brain.data.room_repos[room]
    if repo
      msg.send "This room's default repo is #{repo}"
    else
      msg.send "This room doesn't have a default repo yet"  
