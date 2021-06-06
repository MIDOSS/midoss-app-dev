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

<%block name="navbar">
  <nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed"
                data-toggle="collapse" data-target="#bs-midoss-navbar-collapse"
                aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href=${request.route_url('site.index')}>MIDOSS</a>
      </div>
      <div id="bs-midoss-navbar-collapse" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle"
               data-toggle="dropdown" role="button"
               aria-haspopup="true" aria-expanded="false">
              About <span class="caret"></span>
            </a>
            <ul class="dropdown-menu" role="menu">
	      <li><a href=${request.route_url('about.project')}>Project</a></li>
              <li><a href=${request.route_url('about.contributors')}>Contributors</a></li>
              <li><a href=${request.route_url('about.license')}>License</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
  </nav>
</%block>