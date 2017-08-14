# Description
#   Get someone's attention by having your bot mention them alongside a humorous poke message.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot poke target - Mention someone with a poke
#
# Author:
#   kwandrews7

module.exports = (robot) ->

  robot.respond /poke (.+)/i, (msg) ->

    victimStr = msg.match[2]
    victimStr = victimStr.substr(1) if victimStr.charAt(0) is '@'

    users = robot.brain.usersForFuzzyName(victimStr)
    if users.length > 1
      msg.reply "Be more specific; I can only poke one person at a time!"
      return
    victim = if users.length is 1 then users[0] else null

    if not victim
      msg.reply "I can't find the person you want me to poke. Are you sure they exist?"
      msg.reply "https://media1.giphy.com/media/6uGhT1O4sxpi8/giphy.gif"
      return

    victimName = victim.name

    msg.random [
      "pokes @#{victimName}, who begins to writhe in pain!",
      "pokes @#{victimName}. #{victimName} shivers and ticks until he suddenly loses all surface tension.",
      "pokes @#{victimName}. Nothing happens.",
      "pokes @#{victimName}. They explode immediately, oops."
      "pokes @#{victimName}. They convulses briefly, then stop.",
      "pokes @#{victimName}. It's quiet, _too_ quiet.",
      "pokes @#{victimName}, resulting in a clash of wills. Sparks fly, thunder crashes, dogs bark, and @#{victimName} implodes.",
      "pokes @#{victimName}. They look mad. This might have been a bad decision.",
      "pokes @#{victimName}. _Ooh_, that was fun. _Pokes @#{victimName} a few more times for good measure._"
    ]
