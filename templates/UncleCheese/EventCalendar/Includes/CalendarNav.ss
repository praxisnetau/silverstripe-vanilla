<% if $IsCalendarPage %>

<% if $RegionsWithEvents %>
<h3>JUMP TO A REGION</h3>
<ul>
<% loop $RegionsWithEvents %>
  <li>
    <a href="$Link">$Title</a>
  </li>
<% end_loop %>
</ul>
<% end_if %>

<div class="event-calendar-controls">
  <% include UncleCheese\EventCalendar\Includes\MonthJumper %>
</div>

<hr />
<p class="event-calendar-feed"><a href="$Link(rss)"><% _t('UncleCheese\EventCalendar\Pages\Calendar.SUBSCRIBE', 'Calendar RSS Feed') %></a></p>
<% end_if %>
