<nav class="navbar navbar-expand-lg navbar-dark">
  <a class="navbar-brand" href="$BaseHref">$SiteConfig.Title</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#NavbarNav" aria-controls="NavbarNav" aria-expanded="false" aria-label="Toggle Navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="NavbarNav">
    <% if $SiteConfig.Tagline %>
      <span class="navbar-text">
        $SiteConfig.Tagline
      </span>
    <% end_if %>
    <ul class="navbar-nav ml-auto">
      <% loop $Menu(1) %>
        <li class="nav-item<% if $LinkingMode != 'link' %> active<% end_if %><% if $Children %> dropdown<% end_if %>">
          <% if $Children %>
            <a class="nav-link dropdown-toggle" id="dropdown-{$URLSegment}" href="$Link" title="$Title.XML" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">$MenuTitle.XML</a>
            <div class="dropdown-menu" aria-labelledby="dropdown-{$URLSegment}">
              <% loop $Children %>
                <a class="dropdown-item" href="$Link" title="$Title.XML">
                  <span class="nav-text">$MenuTitle.XML</span>
                  <% if $LinkingMode == 'current' %>
                    <span class="sr-only">(current)</span>
                  <% end_if %>
                </a> 
              <% end_loop %>
            </div>
          <% else %>
            <a class="nav-link" href="$Link" title="$Title.XML">
              <span class="nav-text">$MenuTitle.XML</span>
              <% if $LinkingMode == 'current' %>
                <span class="sr-only">(current)</span>
              <% end_if %>
            </a>
          <% end_if %>
        </li>
      <% end_loop %>
    </ul>
  </div>
</nav>
