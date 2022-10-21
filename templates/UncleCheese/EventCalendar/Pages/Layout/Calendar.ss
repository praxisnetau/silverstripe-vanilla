

$Content
$ElementalArea

<h2 class="event-calendar-dateheader">$DateHeader</h2>
<% if $Events %>
	<div id="event-calendar-events" class="event-calendar-events-list">
		<% include UncleCheese\EventCalendar\Includes\EventList %>
	</div>
<% else %>
	<p><% _t('UncleCheese\EventCalendar\Pages\Calendar.NOEVENTS','There are no events') %>.</p>
<% end_if %>
