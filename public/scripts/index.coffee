PALETTE = ['fuchsia', 'blue', 'cyan', 'red', 'yellow', 'lime']
AUTO_SPLATTERS = [500, 800, 600, 500, 600, 400, 800, 500, 1000, 1200, 800, 1000, 500, 500, 800, 600, 500, 600, 400, 800, 500]
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

episodeUrl = (number) ->
  EPISODES["EP#{number}"].URL

index = new Vue
  el: '#app'
  data:
    page: 'index-page'
    pirijan: PIRIJAN
    michelle: MICHELLE
    soundcloud: SOUNDCLOUD
    itunes: ITUNES
    twitter: TWITTER
    kaomoji: randomKoamoji()
    ep1: episodeUrl 1
    ep2: episodeUrl 2
    ep3: episodeUrl 3
    ep4: episodeUrl 4
    ep5: episodeUrl 5
    ep6: episodeUrl 6
    ep7: episodeUrl 7
    ep8: episodeUrl 8
    ep9: episodeUrl 9
    ep10: episodeUrl 10

  methods:
    splatter: (event) ->
      x = event.clientX
      y = event.clientY
      addSplatter x, y
