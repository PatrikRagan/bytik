d = React.DOM
########################################
@Modal = React.createClass
  getInitialState: ->
    showModal: false
#  close: ->
#    @setState(showModal: false)
  openDialog: ->
    if @state.showModal == false
      @setState(showModal: true)
    else
      @setState(showModal: false)
  render: ->
    d.div
      className: "modal-container"
      d.button
        onClick: () =>
          @openDialog()
        className: "btn btn-warning col-lg-12 "
        @props.name
      if @state.showModal
        d.div
          className: "modal-backdrop"
          d.div
            className: 'modal-dialog'
            d.div
              className: 'modal-content'
              d.div
                className: 'modal-header'
                d.button
                  type: 'button'
                  className: 'btn btn-default'
                  onClick: () =>
                    @openDialog()
                  'Close'
              d.div
                className: 'modal-body'
                "fuck"
              d.div
                className: 'modal-footer'
                d.button
                  type: 'button'
                  className: 'btn btn-default'
                  "ahoj"

createModal = React.createFactory(Modal)
########################################
@Content = React.createClass
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


content = React.createFactory(@Content)

@Partial = React.createClass
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
    console.log(@props.name+ " > @props.name")
    d.div
      className: "row"
      d.button
#        type: 'button'
        className: 'btn btn-warning'
#        className: "btn btn-primary col-lg-12 "
        @props.name
#        onClick: () =>
#          @linkClicked()
    d.div
      className: "row"
      for scrap in @props.scraps
        partial
          key: scrap.id
          object: scrap

createScrapsAccordion = React.createFactory(Accordion)



