DOM = React.DOM
@CreateNewMeetupForm = React.createClass
  getInitialState: ->
    meetup: {
      title: "",
      description: "",
      date: new Date(),
      technology: @props.technologies[0].name,
      seoText: null,
      guests: [""],
    }
    warnings: {
      title: null
    },
  titleChanged: (event) ->
    @state.meetup.title = event.target.value
    @validateTitle()
    @forceUpdate()
  validateTitle: () ->
    @state.warnings.title = if /\S/.test(@state.meetup.title) then null else "Cannot be bl\
    ank"
  descriptionChanged: (event) ->
    @state.meetup.description = event.target.value
    @forceUpdate()
  dateChanged: (newDate) ->
    @state.meetup.date = newDate
    @forceUpdate()
  technologyChanged: (event) ->
    @state.meetup.technology = event.target.value
    @forceUpdate()
  seoChanged: (seoText) ->
    @state.meetup.seoText = seoText
    @forceUpdate()
  guestEmailChanged: (number, event) ->
    guests = @state.meetup.guests
    guests[number] = event.target.value
    lastEmail = guests[guests.length - 1]
    penultimateEmail = guests[guests.length - 2]
    if (lastEmail != "")
      guests.push("")
    if (guests.length >= 2 && lastEmail == "" && penultimateEmail == "")
      guests.pop()
    @forceUpdate()
  computeDefaultSeoText: () ->
    words = @state.meetup.title.toLowerCase().split(/\s+/)
    #    words.push(monthName(@state.meetup.date.getMonth()))
    words.push(@state.meetup.date.getFullYear().toString())
    words.filter((string) -> string.trim().length > 0).join("-").toLowerCase()
  formSubmitted: (event) ->
    event.preventDefault()
    meetup = @state.meetup

    @validateTitle()
    @forceUpdate()

    for own key of meetup
      return if @state.warnings[key]
    $.ajax
      url: "/meetups.json"
      type: "POST"
      dataType: "JSON"
      contentType: "application/json"
      processData: false
      data: JSON.stringify({
        meetup: {
          title: @state.meetup.title,
          seo: @state.meetup.seoText,
          description: @state.meetup.description,
          guests: @state.meetup.guests,
          technology: @state.meetup.technology
        }
      })
  render: ->
    DOM.form
      onSubmit: @formSubmitted
      className: "form-horizontal"
      method: "post"
      action: "/meetups"
      DOM.fieldset null,
        DOM.legend null, "New Meetup"

          formInputWithLabel
            id: "title"
            value: @state.meetup.title
            onChange: @titleChanged
            placeholder: "Meetup title"
            labelText: "Title"
            warning: @state.warnings.title

          formInputWithLabel
            id: "description"
            value: @state.meetup.description
            onChange: @descriptionChanged
            placeholder: "Meetup description"
            labelText: "Description"
            elementType: "textarea"

          dateWithLabel
            id: "date"
            labelText: "Date"
            value: @state.meetup.date
            onChange: @dateChanged
            date: @state.meetup.date

          DOM.div
            className: "form-group"
            DOM.label
              htmlFor: "technology"
              className: "col-lg-2 control-label"
              "Technology"
            DOM.div
              className: 'col-lg-10'
              DOM.select
                className: "form-control"
                onChange: @technologyChanged
                value: @state.meetup.technology
                DOM.option(value: tech.name, key: tech.id, tech.name) for tech in @props.technologies

          formInputWithLabelAndReset
            id: "seo"
            value: if @state.meetup.seoText? then @state.meetup.seoText else @computeDefaultSeoText()
            onChange: @seoChanged
            placeholder: "SEO text"
            labelText: "seo"

          DOM.fieldset null,
            DOM.legend null, "Guests"
            for guest, n in @state.meetup.guests
              ((i) =>
                formInputWithLabel
                  id: "email"
                  key: "guest-#{i}"
                  value: guest
                  onChange: (event) =>
                    @guestEmailChanged(i, event)
                  placeholder: "Email address of an invitee"
                  labelText: "Email")(n)

          DOM.div
            className: "form-group"
            DOM.div
              className: "col-lg-10 col-lg-offset-2"
              DOM.button
                type: "submit"
                className: "btn btn-primary"
                "Save"

createNewMeetupForm = React.createFactory(CreateNewMeetupForm)

@FormInputWithLabel = React.createClass
  getDefaultProps: ->
    elementType: "input"
    inputType: "text"
    displayName: "FormInputWithLabel"
  render: ->
    DOM.div
      className: "form-group"
      DOM.label
        htmlFor: @props.id
        className: "col-lg-2 control-label"
        @props.labelText
      DOM.div
        className: "col-lg-10" + {true: 'has-warning', false: ''}[!!@props.warning]
        @warning()
        DOM[@props.elementType]
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
    DOM.label
      className: "control-label"
      htmlFor: @props.idc
      @props.warning

formInputWithLabel = React.createFactory(FormInputWithLabel)



DateWithLabel = React.createClass
  getDefaultProps: ->
    date: new Date()
  onYearChange: (event) ->
    newDate = new Date(
      event.target.value,
      @props.date.getMonth(),
      @props.date.getDate()
    )
    @props.onChange(newDate)
  render: ->
    DOM.div
      className: "form-group"
      DOM.label
        htmlFor: @props.id
        className: "col-lg-2 control-label"
        @props.labelText
      DOM.div
        className: "col-lg-10"
        DOM.select
          className: "form-control"
          onChange: @onYearChange
          value: @props.date.getFullYear()
          DOM.option(value: year, key: year, year) for year in [2015..2020]

dateWithLabel = React.createFactory(DateWithLabel)

FormInputWithLabelAndReset = React.createClass
  displayName: "FormInputWithLabelAndReset"
  render: ->
    DOM.div
      className: "form-group"
      DOM.label
        htmlFor: @props.id
        className: "col-lg-2 control-label"
        @props.labelText
      DOM.div
        className: "col-lg-8"
        DOM.div
          className: "input-group"
          DOM.input
            className: "form-control"
            placeholder: @props.placeholder
            id: @props.id
            value: @props.value
            onChange: (event) =>
              @props.onChange(event.target.value)
          DOM.span
            className: "input-group-btn"
            DOM.button
              onClick: () =>
                @props.onChange(null)
              className: "btn btn-default"
              type: "button"
              DOM.i
                className: "fa fa-magic"
            DOM.button
              onClick: () =>
                @props.onChange("")
              className: "btn btn-default"
              type: "button"
              DOM.i
                className: "fa fa-times-circle"

formInputWithLabelAndReset = React.createFactory(FormInputWithLabelAndReset)