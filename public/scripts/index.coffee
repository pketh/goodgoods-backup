PALETTE = ['fuchsia', 'blue', 'cyan', 'red', 'yellow', 'lime']
canvas = undefined
context = undefined

window.onload = ->
  canvas = document.getElementById('background')
  canvas.width = window.innerWidth
  canvas.height = window.innerHeight
  context = canvas.getContext('2d')

window.onresize = ->
  console.log 'resized'
  canvas.width = window.innerWidth
  canvas.height = window.innerHeight
  context = canvas.getContext('2d')

addSplatter = (x, y) ->
  size = 50
  context.beginPath()
  context.arc(x, y, size, 0, 2 * Math.PI)
  context.closePath()
  context.fillStyle = _.sample PALETTE
  context.fill()
  
index = new Vue
  el: '#app'
  data:
    page: 'index-page'
    message: 'sup sup'
    splatter: (event) ->
      x = event.clientX
      y = event.clientY
      addSplatter x, y
