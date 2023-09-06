<footer>
  <div class="container">
    <div class="row">
      <div class="col-md">
        <div class="footer-links d-flex flex-column align-items-center align-items-lg-stretch justify-content-lg-start flex-lg-row">
          <a class="home-link" href="$BaseHref">$SiteConfig.Title</a>
          <i class="fa fa-chevron-right"></i>
          <nav class="footer">
            <ul>
              <% loop $Menu(1) %>
                <li class="$LinkingMode"><a href="$Link" title="$Title.XML">$MenuTitle.XML</a></li>
              <% end_loop %>
            </ul>
          </nav>
        </div>
      </div>
      <div class="col-md">
       <% if $SiteConfig.FooterAuthorisation %>
          <div class="d-flex flex-column align-items-center align-items-lg-stretch justify-content-lg-end flex-lg-row">
            <div class="authorisation">$SiteConfig.FooterAuthorisation</div>
          </div>
        <% end_if %>
        <div class="footer-credits d-flex flex-column align-items-center align-items-lg-stretch justify-content-lg-end flex-lg-row">
          <div class="theme">
            Theme by Praxis Interactive
          </div>
          <div class="powered">
            <span class="text">
            Supported by <a href="https://www.sunnysideup.co.nz/">Sunny Side Up</a>
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
