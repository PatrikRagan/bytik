d = React.DOM
########################################

########################################
@Modal = React.createClass
  getInitialState: ->
    showModal: false
#  close: ->
#    @setState(showModal: false)
  turnOnOffDialog: ->
    if @state.showModal == false
      @setState(showModal: true)
    else
      @setState(showModal: false)
  modal: ->
    div
      className: 'modal in'
      tabIndex: -1
      role: 'dialog'
      'aria-hidden': false
      ref: 'modal'
      style:
        display: 'block'
      div
        className: 'modal-dialog'
        div
          className: 'modal-content'
          @props.children
  render: ->
    d.div
      className: "modal-container  in"
      d.button
        onClick: () =>
          @turnOnOffDialog()
        className: "btn btn-warning col-lg-2 col-lg-offset-2 "
        "Add new search"
      if @state.showModal
        d.div
          className: "modal-backdrop"
          d.div
            className: "modal in"
            tabIndex: -1
            role: 'dialog'
            'aria-hidden': false
            ref: 'modal'
            style:
              display: 'block'
          d.div
            className: 'modal-dialog'
            d.div
              className: 'modal-content'
#              d.div
#                className: 'modal-header'
              d.div
                className: 'modal-body'
                scrapForm
                  instance: @props.scraps
              d.div
                className: 'modal-footer'
                d.button
                  type: 'button'
                  className: 'btn btn-default'
                  onClick: () =>
                    @turnOnOffDialog()
                  'Close'

createModal = React.createFactory(Modal)

ScrapForm = React.createClass
  getInitialState: ->
    showModal: false
    scrap: {
      city: "",
      part_of_town: "",
    }
    warnings: {
      city: null
    },
  part_of_townChanged: (event) ->
    @state.scrap.part_of_town = event.target.value
    #    @validateTitle()
    @forceUpdate()
  cityChanged: (event) ->
    @state.scrap.city = event.target.value
#    @validateTitle()
    @forceUpdate()
  formSubmitted: ->
#    event.preventDefault()
    scrap = @state.scrap
    @forceUpdate()
    $.ajax
      url: "/scraps.json"
      type: "POST"
      dataType: "JSON"
      contentType: "application/json"
      processData: false
      data: JSON.stringify({
        scrap: {
          city: @state.scrap.city,
          part_of_town: @state.scrap.part_of_town
        }
      })
  render: ->
    console.log(@props.object)
    d.form
      onSubmit: @formSubmitted
      className: "form-horizontal"
#      method: "post"
#      action: "/scraps"
      d.fieldset null,
        d.legend null, "New Scrap"

          formInputWithLabel
            id: "city"
            value: @state.scrap.city
            onChange: @cityChanged
            placeholder: "Scrap title"
            labelText: "city"
            warning: @state.warnings.city

          formInputWithLabel
            id: "part_of_town"
            value: @state.scrap.part_of_town
            onChange: @part_of_townChanged
            placeholder: "part_of_town title"
            labelText: "part_of_town"
            warning: @state.warnings.part_of_town

          formInputWithLabel
            id: "room_count"
            value: @state.scrap.room_count
            onChange: @part_of_townChanged
            placeholder: "part_of_town title"
            labelText: "room_count"
            warning: @state.warnings.room_count

          formInputWithLabel
            id: "keywords"
            value: @state.scrap.keywords
            onChange: @part_of_townChanged
            placeholder: "keywords title"
            labelText: "keywords"
            warning: @state.warnings.keywords
            elementType: "textarea"

          formInputWithLabel
            id: "price_min"
            value: @state.scrap.price_min
            onChange: @part_of_townChanged
            placeholder: "price_min title"
            labelText: "price_min"
            warning: @state.warnings.price_min
            elementType: "textarea"

          formInputWithLabel
            id: "price_max"
            value: @state.scrap.price_max
            onChange: @part_of_townChanged
            placeholder: "price_max title"
            labelText: "price_max"
            warning: @state.warnings.price_max
            elementType: "textarea"

      d.button
        type: 'submit'
        className: 'btn btn-primary'
        "Save"
scrapForm = React.createFactory(ScrapForm)
########################################
@FormInputWithLabel = React.createClass
  getDefaultProps: ->
    elementType: "input"
    inputType: "text"
    displayName: "FormInputWithLabel"
  render: ->
    d.div
      className: "form-group"
      d.label
        htmlFor: @props.id
        className: "col-lg-2 control-label"
        @props.labelText
      d.div
        className: "col-lg-10" + {true: 'has-warning', false: ''}[!!@props.warning]
        @warning()
        d[@props.elementType]
          className: "form-control"
          placeholder: @props.placeholder
          id: @props.id
          value: @props.value
          onChange: @props.onChange
          type: @tagType()
  tagType: ->
    {
    "input": @props.inputType,
    "textarea": null,
    }[@props.elementType]
  warning: ->
    return null unless @props.warning
    d.label
      className: "control-label"
      htmlFor: @props.idc
      @props.warning

formInputWithLabel = React.createFactory(FormInputWithLabel)

########################################
Content = React.createClass
  contentData: ->
    {
      true:
        d.div
          className: "col-lg-9"
          d.span
            "content #{@props.instance.part_of_town}"
            d.div
              className: "col-lg-3"
              "city #{@props.instance.city}"
            d.div
              className: "col-lg-3"
              "price #{@props.instance.price_min}"
            d.div
              className: "col-lg-3"
              "room #{@props.instance.room_count}"
    }[@props.trigerred]
  render: ->
    console.log(@props.instance.part_of_town + " > @props.instance in render")
    d.div
      className: "row"
      @contentData()


content = React.createFactory(Content)

Partial = React.createClass
  getInitialState: ->
    clicked: false
  getDefaultProps: ->
    clicked: false
  linkClicked: ->
    console.log("> linkClicked")
    if @state.clicked == true
      @state.clicked = false
    else
      @state.clicked = true
    @forceUpdate()
  render: ->
    d.div
      className: "col-lg-8"
      d.button
        onClick: () =>
          @linkClicked()
        className: "btn btn-primary col-lg-12 "
        @props.object.city
      d.div
        className: ""
        content
          key: @props.object.id
          instance: @props.object
          trigerred: @state.clicked

partial = React.createFactory(Partial)


@Accordion = React.createClass
  render: ->
    d.div
      className: "row"
      d.button
#        type: 'button'
        className: 'btn btn-warning'
#        className: "btn btn-primary col-lg-12 "
        "Add new search"
#        onClick: () =>
#          @linkClicked()
    d.div
      className: "row"
      for scrap in @props.scraps
        partial
          key: scrap.id
          object: scrap

createScrapsAccordion = React.createFactory(Accordion)



