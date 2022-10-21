<aside class="col-md-3 sidebar">
  <% if $Menu(2) %>
    <nav class="secondary">
      <% with $Level(1) %>
        <h3>$MenuTitle.XML</h3>
        <% include Sidebar\Menu %>
      <% end_with %>
    </nav>
  <% end_if %>

  <% if IsCalenderPage %>
  <p class="event-calendar-feed"><a href="$Link(rss)"><% _t('UncleCheese\EventCalendar\Pages\Calendar.SUBSCRIBE', 'Calendar RSS Feed') %></a></p>

  <div class="event-calendar-controls">
  	$CalendarWidget
  	<% include UncleCheese\EventCalendar\Includes\MonthJumper %>
  	<% include UncleCheese\EventCalendar\Includes\QuickNav %>
  </div>

  <% end_if %>

</aside>
