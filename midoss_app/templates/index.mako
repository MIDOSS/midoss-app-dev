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
<%inherit file="site.mako"/>

<%block name="title">MIDOSS App (development)</%block>

<div class="container-fluid">
  <div class="row">
    <div class="col-sm-2" id="maptools">
      <label for="variable">Variable</label>
      <select id="variable">
	<option value="surfacepresence">Surface Presence</option>
	<option value="watercolumnpresence">Water Column Presence</option>
	<option value="surfaceconcentration">Surface Concentration</option>
      </select>
      <label for="oiltype">Oil Type</label>
      <select id="oiltype">
        <option value="all">All Types</option>
	<option value="bunker">Bunker-C</option>
        <option value="diesel">Diesel</option>
      </select>
    </div>
    <div class="container-fluid">
      <div class="col-sm-10" id="map"></div>
    </div>
  </div>
</div>

<%block name="page_js">
  <script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.5.0/build/ol.js"></script>
  <script src="${request.static_path("midoss_app:static/js/map.js")}"></script>
</%block>