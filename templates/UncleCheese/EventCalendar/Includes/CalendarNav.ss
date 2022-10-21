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
  $CalendarWidget
  <% include UncleCheese\EventCalendar\Includes\MonthJumper %>
</div>

<style>
  .event-calendar-month-jumper .fields {width: 80%!important; float: left;}
  .event-calendar-month-jumper .field.dropdown {width: calc(50% - 10px)!important; float: left; margin-right: 10px; }
  .event-calendar-month-jumper .actions {width: 19%!important; display: inline-block;}
</style>


<p class="event-calendar-feed"><a href="$Link(rss)"><% _t('UncleCheese\EventCalendar\Pages\Calendar.SUBSCRIBE', 'Calendar RSS Feed') %></a></p>
<% end_if %>
