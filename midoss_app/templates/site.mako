## Copyright 2014-2019 The Salish Sea MEOPAR Contributors
## and The University of British Columbia
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##    https://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width initial-scale=1">

  <title>
    <%block name="title">MIDOSS App (development)</%block>
  </title>

  <link rel="icon"
        href=${request.static_path("midoss_app:static/img/MEOPAR_favicon.ico")} >

  <%block name="site_css">
    <link rel="stylesheet"
          href=${request.static_path("midoss_app:static/css/bootswatch-3.3.7/superhero/bootstrap.min.css")}>
    <link rel="stylesheet"
          href=${request.static_path("midoss_app:static/css/site.css")}>
  </%block>

  <%block name="page_css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.5.0/css/ol.css" type="text/css">
    <style>
      #map {
      	padding: 0px;
        height: 700px;
      }
    </style>
  </%block>

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>

<body id="top" onload="init()">
  <%namespace name="nav" file="nav.mako"/>
  ${nav.navbar()}

  ${next.body()}

<footer class="footer">
  <div class="container">
    <p>
      ?? Copyright ${request.copyright_years}
      <a href=${request.route_url('about.contributors')}>
        MIDOSS Project Contributors
      </a> and The University of British Columbia
      <br>
      Licensed under the Apache License, Version 2.0.
      <a href="https://www.apache.org/licenses/LICENSE-2.0">https://www.apache.org/licenses/LICENSE-2.0</a>.
    </p>
  </div>
</footer>

  <%block name="site_js">
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"
			  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
			  crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous">
    </script>
    <script src="https://use.fontawesome.com/69836a17ac.js"></script>
  </%block>

  <%block name="page_js">
    <script>
      function init() { }
    </script>
  </%block>
</body>
</html>