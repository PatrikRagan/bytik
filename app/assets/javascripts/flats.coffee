Promise = $.Deferred
{div, button, h4} = React.DOM

@Modal = React.createClass
  displayName: 'Modal'

  backdrop: ->
    div
      className: 'modal-backdrop in'

  modal: ->
#    div
#      className: 'modal in'
#      tabIndex: -1
#      role: 'dialog'
#      'aria-hidden': false
#      ref: 'modal'
#      style:
#        display: 'block'
    div
      className: 'modal-dialog'
      div
        className: 'modal-content'
        @props.children

  render: ->
    div null,
      @backdrop()
      @modal()

@Confirm = React.createClass
  displayName: 'Confirm'

  getDefaultProps: ->
    confirmLabel: 'OK'
    abortLabel: 'Cancel'

  abort: ->
#    @promise.reject()
#
  confirm: ->
#    @promise.resolve()

  componentDidMount: ->
#    @promise = new Promise()
    React.findDOMNode(@refs.confirm).focus()

  render: ->
    React.createElement Modal, null,
      div
        className: 'modal-header'
        h4 className: 'modal-title', @props.message
      if @props.description
        div
          className: 'modal-body'
          @props.description
      div
        className: 'modal-footer'
        div
          className: 'text-right'
          button
            role: 'abort'
            type: 'button'
            className: 'btn btn-default'
            onClick: @abort
            @props.abortLabel
          ' '
          button
            role: 'confirm'
            type: 'button'
            className: 'btn btn-primary'
            ref: 'confirm'
            onClick: @confirm
            @props.confirmLabel

confirm = (message, options = {}) ->
  props = $.extend({message: message}, options)
  wrapper = document.body.appendChild(document.createElement('div'))
  component = React.render(React.createElement(Confirm, props), wrapper)
  cleanup = ->
    React.unmountComponentAtNode(wrapper)
    setTimeout -> wrapper.remove()
#  component.promise.always(cleanup).promise()

$ ->
  $('.removable').click ->
    confirm('Are you sure?', description: 'Would you like to remove this item from the list?', confirmLabel: 'Yes', abortLabel: 'No')
    .then => $(@).parent().remove()
