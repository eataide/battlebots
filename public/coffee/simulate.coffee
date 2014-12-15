App = angular.module("App")

App.controller "SimulateCtrl", ($scope, $rootScope, $location, $http) ->
  # list of commands to follow
  pos = []

  for command in $rootScope.program
    pos.push command.command

  # list of rocks (obstacles)
  rockList = [
    {x: 200, y: 100},
    {x: 500, y: 300}
  ]

  # flag if simulation still running
  stillRunning = true

  # check if a position intersects an obstacle
  intersects = (cur, ss) ->
    for rock in rockList
      if (rock.x is cur.x and rock.y is cur.y)
        console.log "#{cur.x}, #{cur.y} : #{rock.x}, #{rock.y}"
        return true
      else
        return false

  # draws all rocks in rockList
  drawRocks = (context, rockList, ss) ->
    for rock in rockList
      context.beginPath()
      context.rect(rock.x, rock.y, ss, ss)
      context.fillStyle = 'gray'
      context.fill()


  jQuery ($) ->
    # get canvas element
    canvas = document.getElementById('canvas')
    context = canvas.getContext('2d')

    # define size of square to draw
    ss = 100

    # define path for square to follow
    cur = {x: 0, y: 0}
    context.rect(cur.x, cur.y, ss, ss)
    context.fillStyle = 'red'
    context.fill()

    # draw rocks
    drawRocks(context, rockList, ss)

    # calculate new position after moving
    move = (command, cur) ->
      if command is "up"
        return {x: cur.x, y: cur.y - ss}
      else if command is "down"
        return {x: cur.x, y: cur.y + ss}
      else if command is "left"
        return {x: cur.x - ss, y: cur.y}
      else if command is "right"
        return {x: cur.x + ss, y: cur.y}

    # start counter
    i = 0

    # run simulation
    simulation = setInterval ->
      if stillRunning
        # clear canvas
        context.clearRect(0, 0, canvas.height, canvas.width)

        # redraw robot in new position
        context.beginPath()
        cur = move(pos[i], cur)

        # check if next move hits obstacle
        if intersects(cur, ss)
          r = confirm "Sorry, you died. Would you like to try again?"
          if r == true
              window.location.href = "#program"
          else
              window.location.href = "#"
          stillRunning = false
        else
          context.rect(cur.x, cur.y, ss, ss)
          context.fillStyle = 'red'
          context.fill()

        # redraw rocks after clearing canvas
        drawRocks(context, rockList, ss)

        i += 1
    , 1000

