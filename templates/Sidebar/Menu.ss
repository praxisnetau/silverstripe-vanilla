<% if $LinkOrSection = 'section' %>
  <% if $Children %>
    <ul class="fa-ul">
      <% loop $Children %>
        <li class="$LinkingMode">
          <i class="fa fa-li fa-chevron-right text-primary"></i>
          <a href="$Link" title="$Title.XML">$MenuTitle.XML</a>
          <% if $Children %>
            <% include Sidebar\Menu %>
          <% end_if %>
        </li>
      <% end_loop %>
    </ul>
  <% end_if %>
<% end_if %>
