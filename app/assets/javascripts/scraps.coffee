d = React.DOM
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
      room_count:  "",
      keywords: "",
      price_min:  "",
      price_max:  "",
    }
    warnings: {
      city: null,
      part_of_town: null,
      room_count:  null,
      keywords: null,
      price_min:  null,
      price_max:  null,
    },
  validateCity: () ->
    @state.warnings.city = if /\S/.test(@state.scrap.city) then null else d.div
        className: ""
        "Cannot be blank"
    /\S/.test(@state.scrap.city)
  validateRoom: () ->
    @state.warnings.room_count = if /\S/.test(@state.scrap.room_count) then null else d.div
      className: ""
      "Cannot be blank"
    /\S/.test(@state.scrap.room_count)
  price_minChanged: (event) ->
    @state.scrap.price_min = event.target.value
    #    @validateTitle()
    @forceUpdate()
  price_maxChanged: (event) ->
    @state.scrap.price_max = event.target.value
    #    @validateTitle()
    @forceUpdate()
  room_countChanged: (event) ->
    @state.scrap.room_count = event.target.value
    #    @validateTitle()
    @forceUpdate()
  keywordsChanged: (event) ->
    @state.scrap.keywords = event.target.value
    #    @validateTitle()
    @forceUpdate()
  part_of_townChanged: (event) ->
    @state.scrap.part_of_town = event.target.value
    #    @validateTitle()
    @forceUpdate()
  cityChanged: (event) ->
    @state.scrap.city = event.target.value
#    @validateCity()
    @forceUpdate()
  formSubmitted: (event) ->
#    event.preventDefault()
    scrap = @state.scrap
#    @validateCity()
    if @validateCity() == false || @validateRoom() == false
      console.log("preventing!")
      event.preventDefault()
    @forceUpdate()
    for own key of @state.scrap
      return if @state.warnings[key]
    $.ajax
      url: "/scraps.json"
      type: "POST"
      dataType: "JSON"
      contentType: "application/json"
      processData: false
      data: JSON.stringify({
        scrap: {
          city: @state.scrap.city,
          part_of_town: @state.scrap.part_of_town,
          room_count: @state.scrap.room_count
          keywords: @state.scrap.keywords
          price_min: @state.scrap.price_min
          price_max: @state.scrap.price_max
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
            onChange: @room_countChanged
            placeholder: "part_of_town title"
            labelText: "room_count"
            warning: @state.warnings.room_count

          formInputWithLabel
            id: "keywords"
            value: @state.scrap.keywords
            onChange: @keywordsChanged
            placeholder: "keywords title"
            labelText: "keywords"
            warning: @state.warnings.keywords
            elementType: "textarea"

          formInputWithLabel
            id: "price_min"
            value: @state.scrap.price_min
            onChange: @price_minChanged
            placeholder: "price_min title"
            labelText: "price_min"
            warning: @state.warnings.price_min
            elementType: "textarea"

          formInputWithLabel
            id: "price_max"
            value: @state.scrap.price_max
            onChange: @price_maxChanged
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
        className: "col-lg-8" + {true: ' has-warning', false: ''}[!!@props.warning]
        @warning()
        d[@props.elementType]
          className: "col-lg-6"
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
          className: "col-lg-8"
          d.div
            className: "col-lg-4"
            "part of town #{@props.instance.part_of_town}"
          d.div
            className: "col-lg-4"
            "city #{@props.instance.city}"
          d.div
            className: "col-lg-4"
            "price #{@props.instance.price_min}"
          d.div
            className: "col-lg-4"
            "room #{@props.instance.room_count}"
          d.div
            className: "col-lg-8"
            d.a
              href: "scraps/#{@props.instance.id}",
              className: "btn btn-primary"
              "Open search"
    }[@props.trigerred]
  render: ->
    console.log(@props.instance.part_of_town + " > @props.instance in render")
    d.div
      className: "row"
      @contentData()


content = React.createFactory(Content)

Partial = React.createClass
  propTypes: ->
    update: React.PropTypes.func
  getInitialState: ->
    clicked: false
  getDefaultProps: ->
    clicked: false
  updates: (num) ->
    console.log("updates child>> ")
    @linkClicked()
    console.log("updates child, link clicked>> ")
    @props.updater(num)
    console.log("updates child, callback was called>> ")
  linkClicked: ->
    if @state.clicked == true
      @setState(clicked: false)
    else
      @setState(clicked: true)
  render: ->
    d.div
      className: "col-lg-8"
      d.div
        className: "col-lg-1"
        @props.num
      d.button
        onClick: () =>
          @linkClicked()
        className: "btn btn-primary col-lg-10 "
        "City: #{@props.object.city} Rooms: #{@props.object.room_count}"
      d.div
        className: ""
        content
          key: @props.object.id
          instance: @props.object
          trigerred: @state.clicked
        if @state.clicked == true
          d.button
            className: "btn btn-error"
            onClick: () =>
              $.ajax
                url: "scraps/#{@props.object.id}"
                type: 'DELETE'
                dataType: 'JSON'
                contentType: "application/json"
                processData: false
              @updates(@props.num-1)
            "Delete"

partial = React.createFactory(Partial)


@Accordion = React.createClass
  getInitialState: ->
    childCount:  @props.scraps
    childChanged: true
  updateMe: (num) ->
    @setState(childChanged: false)
    console.log("num> " + num)
    console.log("num> " + @state.childCount.slice(0, num).concat(@state.childCount.slice(num + 1)))
    @setState(childCount: @state.childCount.slice(0, num).concat(@state.childCount.slice(num + 1)))
    @forceUpdate()
    console.log(">> updateMe parent")
  render: ->
    d.div
      className: "row"
      d.button
        className: 'btn btn-warning'
        "Add new search"
    d.div
      className: "row"
      for scrap, i in @state.childCount
        console.log(scrap.num)
        partial
          key: scrap.id
          object: scrap
          num: i+1
          updater: @updateMe

createScrapsAccordion = React.createFactory(Accordion)



