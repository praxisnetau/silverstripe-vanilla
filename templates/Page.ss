<!DOCTYPE html>

<html class="no-js" lang="$ContentLocale">
  <head>
    $ExtendedMetatags
    <% require themedCSS('production/styles/bundle') %>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" rel="stylesheet">
    <%-- require css('http://localhost:8080/production/styles/bundle.css') --%>
  </head>
  <body>

    <% if $HasCacheKeyHeader %>
        <!-- cached -->
        <% cached $CacheKeyHeader(1) %>
            <% include Header %>
        <% end_cached %>
    <% else %>
        <!-- uncached -->
        <% include Header %>
    <% end_if %>

    <% if $HasCacheKeyContent %>
        <!-- cached -->
        <% cached $CacheKeyContent %>
            <% include Layout Layout=$Layout %>
        <% end_cached %>
    <% else %>
        <!-- uncached -->
        <% include Layout Layout=$Layout %>
    <% end_if %>


    <% if $HasCacheKeyFooter %>
        <!-- cached -->
        <% cached $CacheKeyFooter(0) %>
            <% include Footer %>
        <% end_cached %>
    <% else %>
        <!-- uncached -->
        <% include Footer %>
    <% end_if %>
    <% require themedJavascript('production/js/bundle') %>
    <%-- require javascript('http://localhost:8080/production/js/bundle.js') --%>
    <% if $IsAdmin %>
    <a href="$CMSEditLink" class="btn btn-danger" role="button">Edit this page</a>
    <% end_if %>

  </body>
</html>
