PALETTE = ['fuchsia', 'blue', 'cyan', 'red', 'yellow', 'lime']
AUTO_SPLATTERS = [500, 800, 600, 500, 600, 400, 800, 500, 1000, 1200, 800, 1000, 500, 500, 800, 600, 500, 600, 400, 800, 500, 1000, 1200, 800, 1000, 500, 500, 800, 600, 500, 600, 400, 800, 500, 1000, 1200, 800, 1000, 500]
canvas = undefined
context = undefined
windowWidth = undefined

window.onload = ->
  windowWidth = window.innerWidth
  canvas = document.getElementById('background')
  canvas.width = window.innerWidth
  canvas.height = window.innerHeight
  context = canvas.getContext('2d')
  autoSplatter()

window.onresize = ->
  if window.innerWidth != windowWidth
    windowWidth = window.innerWidth
    canvas.width = window.innerWidth
    canvas.height = window.innerHeight + 20
    context = canvas.getContext('2d')
  # else
  #   canvas.height = window.innerHeight

addSplatter = (x, y) ->
  size = 50
  context.beginPath()
  context.arc(x, y, size, 0, 2 * Math.PI)
  context.closePath()
  context.fillStyle = _.sample PALETTE
  context.fill()

addRandomSplatter = ->
  maxX = window.innerWidth
  maxY = window.innerHeight
  x = _.random 0, maxX
  y = _.random 0, maxY
  addSplatter x, y

autoSplatter = -> 
  currentDelay = 0
  AUTO_SPLATTERS.forEach (delay) ->
    setTimeout addRandomSplatter, currentDelay + delay
    currentDelay = currentDelay + delay

randomKoamoji = ->
  KAOMOJI = [
    '( ^_^)／'
    '~ヾ(＾∇＾)'
    '＼(°o°；）'
    '＼(￣O￣)'
  ]
  _.sample(KAOMOJI) + ' '
        
index = new Vue
  el: '#app'
  data:
    page: 'index-page'
    soundcloud: SOUNDCLOUD
    itunes: ITUNES
    twitter: TWITTER
    greeting: randomKoamoji()

  methods:
    splatter: (event) ->
      x = event.clientX
      y = event.clientY
      addSplatter x, y
    # animationend: (event) ->
    #   console.log event
