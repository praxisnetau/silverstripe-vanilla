<aside class="col-lg-3 sidebar">

  <div class="search">
    $SearchEngineBasicForm
  </div>

  <% if $Menu(2) %>
    <nav class="secondary">
      <% with $Level(1) %>
        <h3>$MenuTitle.XML</h3>
        <% include Sidebar\Menu %>
      <% end_with %>
    </nav>
  <% end_if %>

  <% include UncleCheese\EventCalendar\Includes\CalendarNav %>

  <% include ShareThis %>
  <% include JoinUs %>

  <h3>Editors</h3>
  <p class="login-buttons">
    <% if $IsCurrentUser %>
    <a href="$RegisterLink" class="btn btn-secondary" role="button">My Details</a>
    <a href="$LogoutLink" class="btn btn-secondary" role="button">Log out</a>
    <% else %>
    <a href="$LoginLink" class="btn btn-secondary" role="button">Log in</a>
    <% end_if %>
  </p>

</aside>
