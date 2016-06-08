DOM = React.DOM
@Section = React.createClass
  getInitialState: ->
    open: false
    city: @props.technology[0].city,
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
            console.log( @state.city + " >  @city")
          console.log( @props.technology + " >  @state.technology")
          DOM.div
            className: 'col-lg-10'
            DOM.select
              className: "form-control"
              value: @state.city
              DOM.option(value: tech.city, key: tech.id, tech.city) for tech in @props.technology
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
  getInitialState: ->
    technology: @props.technologies[0].city,
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
        technology: @props.technologies


createScrapsAccordion = React.createFactory(Accordion)

# functional component

#Header = (props) =>
#React.DOM.h2
#className: "header"
#props.text
#Header.displayName = "Header"
#header = React.createFactory(Header)

#Creating components based on properties and state.
#BooksListItem = React.createClass
#render: ->
#React.DOM.li({}, @props.book.name)
#booksListItem = React.createFactory(BooksListItem)
#BooksList = React.createClass
#render: ->
#React.DOM.ul({className: 'book-list'}, [
#  for book in @props.books
#  booksListItem({book: book})
## Above you create component from books in our properties.
#])