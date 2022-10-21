<!DOCTYPE html>

<html class="no-js" lang="$ContentLocale">
  <head>
    $MetaTagsExtended
    <% require themedCSS('production/styles/bundle') %>
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <%-- require css('http://localhost:8080/production/styles/bundle.css') --%>
  </head>
  <body>
    <% include Header %>
    <% include Layout Layout=$Layout %>
    <% include Footer %>
    <% require themedJavascript('production/js/bundle') %>
    <%-- require javascript('http://localhost:8080/production/js/bundle.js') --%>
  </body>
</html>
