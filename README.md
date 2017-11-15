# SilverStripe Vanilla Theme

<p align="center">
  <a href="https://i.imgur.com/dse0Sax.png" target="_blank">
    <img src="https://i.imgur.com/dse0Sax.png" alt="Vanilla">
  </a>
</p>

An alternative default theme for SilverStripe v4, based upon:

- [Webpack v3][webpack] (includes [dev server][webpack-dev-server])
- [Bootstrap v4][bootstrap]
- [SilverStripe v4][silverstripe]
- [Font Awesome][font-awesome]
- [Modernizr][modernizr]

Also includes responsive typography styles, and form field template overrides to use Bootstrap form styles.

## Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Issues](#issues)
- [Contribution](#contribution)
- [Attribution](#attribution)
- [Maintainers](#maintainers)
- [License](#license)

## Requirements

- [SilverStripe Framework v4][silverstripe]

## Installation

Installation is via [Composer][composer]:

```sh
$ composer require praxisnetau/silverstripe-vanilla
```

If you want to modify the theme, you will also need to use Yarn (or NPM) to install the theme dependencies:

```sh
$ cd themes/vanilla
$ yarn install
```

## Configuration

To use this theme with your SilverStripe application, you will need to configure `SSViewer` via YAML:

```yaml
SilverStripe\View\SSViewer:
  themes:
    - 'vanilla'
    - '$default'
```

## Usage

This theme includes three modes for working with your source files:

```sh
$ yarn watch  # monitors source files for changes and rebuilds automatically
$ yarn build  # prepares JS/CSS bundles for deployment to production server
$ yarn start  # runs webpack-dev-server to automatically update browser
```
### Watch

Using this mode, your source files will be monitored for changes and your
theme bundles will be automatically rebuilt when a change is detected:

```sh
$ yarn watch
```

Note that when using this mode, you will need to manually refresh your
browser to see the changes.

### Build

When your theme is ready to be deployed to production, you can run `build`
to prepare your JS/CSS bundles. Webpack will optimise and minify the bundles
accordingly:

```sh
$ yarn build
```

### Start

In this mode, `webpack-dev-server` will be started to monitor your
source files changes and will automatically update the browser without the need
to refresh the page:

```sh
$ yarn start
```

This mode is a little trickier to get working than the others. In order
to make use of this mode, you need to inform SilverStripe to
load the theme bundles from the development server, which by default
runs at `http://localhost:8080`.

Open the `templates/Page.ss` file, and look for these lines:

```
<% require themedCSS('production/styles/bundle') %>
<%-- require css('http://localhost:8080/production/styles/bundle.css') --%>

<% require themedJavascript('production/js/bundle') %>
<%-- require javascript('http://localhost:8080/production/js/bundle.js') --%>
```

To use the development server, you'll need to uncomment the `http://localhost:8080` lines and
comment out the `themedCSS` and `themedJavascript` lines.

When your theme is ready for production, you'll need to `build` the bundles and revert back to the
the `themedCSS` and `themedJavascript` lines.

You can make this whole process automatic with some logic added to your
`PageController` class, but that goes beyond the scope of this repo!

## Issues

Please use the [GitHub issue tracker][issues] for bug reports and feature requests.

## Contribution

Your contributions are gladly welcomed to help make this project better.
Please see [contributing](CONTRIBUTING.md) for more information.

## Attribution

- Makes use of [Font Awesome][font-awesome] by [Dave Gandy](https://github.com/davegandy).
- Makes use of [Bootstrap][bootstrap] by the
  [Bootstrap Authors](https://github.com/twbs/bootstrap/graphs/contributors)
  and [Twitter, Inc](https://twitter.com).
- Makes use of [webpack][webpack] and [webpack dev server][webpack-dev-server]
  by [Tobias Koppers](https://github.com/sokra), [Kees Kluskens](https://github.com/SpaceK33z),
  and [many more](https://github.com/webpack/webpack/graphs/contributors).

## Maintainers

[![Colin Tucker](https://avatars3.githubusercontent.com/u/1853705?s=144)](https://github.com/colintucker) | [![Praxis Interactive](https://avatars2.githubusercontent.com/u/1782612?s=144)](http://www.praxis.net.au)
---|---
[Colin Tucker](https://github.com/colintucker) | [Praxis Interactive](http://www.praxis.net.au)

## License

[BSD-3-Clause](LICENSE.md) &copy; Praxis Interactive

[composer]: https://getcomposer.org
[issues]: https://github.com/praxisnetau/silverstripe-vanilla/issues
[webpack]: https://github.com/webpack/webpack
[webpack-dev-server]: https://github.com/webpack/webpack-dev-server
[font-awesome]: http://fontawesome.io
[bootstrap]: http://getbootstrap.com/
[silverstripe]: https://github.com/silverstripe/silverstripe-framework
[modernizr]: https://modernizr.com
