# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#window.startUpdatingChat = ->
#  setInterval(updateChat, 5000)
#
#window.updateChat = ->
#  $('.dynamic').load "/rooms/#{window.roomId}?ajax=true"
#
#
#ready = ->
#  $('#chatbox').scrollTop(9999) #TODO: possible future problem when chat contains many comments and is large than 9999
##  $('#chatbox').animate({scrollTop: $('#chatbox')[0].scrollHeight});
##  window.scrollTo(0,100)
#
#$(document).ready(ready)
#$(document).on('page:load', ready)
#
#ready_ajax = ->
#  $('#chatbox').scrollTop(9999) #TODO: possible future problem when chat contains many comments and is large than 9999
##  $('#chatbox').animate({ scrollTop: $('#chatbox')[0].scrollHeight });
##  window.scrollTo(0,100)
#
#$(document).ready(ready_ajax)
#$(document).on('page:update', ready_ajax)
$ ->
  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
  alert "The commentary was hidden."

  #$ ->
  $('#clicker').click ->
    $('#sticky_commentaries').hide()
    $('#epic').hide()
#    false
#TODO:create toogle for epci
#TODO:toogle only one actual div, viac variable probably

#  $('#clicker').on 'click', ->
#    $('#sticky_commentaries').hide()
#    $('.sticky_commentaries').load('/scraps/1');


hide_comment_link = () ->
  $('#sticky_commentaries').hide()
#hide_comment = () ->
#  $('#add_comment').hide()
#show_comment = () ->
#  $('#add_comment').show()


#  show_comment()
#  false