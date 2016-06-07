DOM = React.DOM
@Section = React.createClass
  getInitialState: ->
    open: false,
    class: "section"
  handleClick: ->
    if @state.open
      console.log(@state.open + " > stav otvoreny")
      @setState({
        open:false,
        class:"section"
      })
    else
      console.log(@state.open + " > stav zatvoreny")
      @setState({
        open: true,
        class: "section open"
      })
  child: ->
    {
      true:
        DOM.div
          className: "article"
          DOM.button
          "TRUE"
    }[@state.open]
  render: ->
    DOM.div
      className: "col-lg-10"
      DOM.button
        className:"btn btn-primary"
        onClick: @handleClick
        "Toggle"
      DOM.div
        className: "sectionhead"
      DOM.section
        title:"Section Title"
        "sekcia"
  #    DOM.a href: "javascript:void(0)"
  #        @props.title
      DOM.div
        className: "articlewrap"
        @child()
      DOM.div
        className: "article"


createSection= React.createFactory(Section)

@Accordion = React.createClass
  getDefaultProps: ->
    title: "halo"
  render: ->
    DOM.div
      className: "main"
      DOM.div
        className: "title"
        @props.title
      DOM.section
        title:"Section Title"
        "Lorem ipsum"
      DOM.section
        title:"Section Title"
        "Lorem ipsum"
      createSection
        id:"sekcia"


createScrapsAccordion = React.createFactory(Accordion)