<main role="main">
  <div class="container">
    <% if IsNotTopLevelPage %>
    <div class="row">
      <div class="col">
        $Breadcrumbs
      </div>
    </div>
    <% end_if %>
    <div class="row">
      <div class="col-md-9">
        $Layout
      </div>
      <% include Sidebar %>
    </div>
  </div>
</main>
