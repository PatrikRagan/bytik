DOM = React.DOM

@Content = React.createClass
  contentData: ->
    {
      true:
        DOM.div
          className: "col-lg-9"
          DOM.span
            "content #{@props.instance.part_of_town}"
            DOM.div
              className: "col-lg-3"
              "city #{@props.instance.city}"
            DOM.div
              className: "col-lg-3"
              "price #{@props.instance.price_min}"
            DOM.div
              className: "col-lg-3"
              "room #{@props.instance.room_count}"
    }[@props.trigerred]
  render: ->
    console.log(@props.instance.part_of_town + " > @props.instance in render")
    DOM.div
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
    DOM.div
      className: "col-lg-8"
      DOM.button
        onClick: () =>
          @linkClicked()
        className: "btn btn-primary col-lg-12 "
        @props.object.city
      DOM.div
        className: ""
        content
          key: @props.object.id
          instance: @props.object
          trigerred: @state.clicked

partial = React.createFactory(Partial)


@Accordion = React.createClass
  render: ->
    DOM.div
      className: "row"
      for scrap in @props.scraps
        partial
          key: scrap.id
          object: scrap

createScrapsAccordion = React.createFactory(Accordion)