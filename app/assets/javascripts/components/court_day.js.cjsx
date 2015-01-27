@CourtDays = React.createClass
  render: ->
    days = _.map @props.days, (day) ->
      <CourtDay court_date={day.court_date} count={day.count} />

    <table>
      <thead>
        <tr>
          <th>Date</th>
          <th>Count</th>
        </tr>
      </thead>
      {days}
    </table>

@CourtDay = React.createClass
  simpleDateFormat: (date) ->
    moment(date).format("dddd, MMMM D YYYY")
  render: ->
    <tr>
      <td title={@props.court_date}>{@simpleDateFormat(@props.court_date)}</td>
      <td>{@props.count}</td>
    </tr>
