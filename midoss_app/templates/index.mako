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
      <fieldset>
        <legend class="m-0">Data Explorer</legend>
	<div class="form-check">
          <input class="form-check-input" type="checkbox" value="" checked="" id="topo-layer">
          <label class="form-check-label" for="topo-layer">Topography Layer</label>
        </div>
	<div class="form-check">
          <input class="form-check-input" type="checkbox" value="" checked="" id="midoss-layer" data-toggle="collapse" data-target="#midoss-selection">
          <label class="form-check-label" for="midoss-layer">Oil Spill Products Layer</label>
        </div>
        <div class="form-group collapse in" id="midoss-selection">
          <label class="form-label" for="variable">Variable</label>
          <select class="form-control" id="variable">
	    <option value="surfaceconcentration">Surface Concentration</option>
	    <option value="surfacepresence">Surface Probability</option>
	    <option value="watercolumnpresence">Water Column Probability</option>
	    <option value="beachingconcentration">Beaching Concentration</option>
	    <option value="beachingpresence">Beaching Probability</option>
	    <option value="beachingtime">Time to Beaching</option>
          </select>
          <label class="form-label" for="oiltype">Oil Type</label>
          <select class="form-control" id="oiltype">
            <option value="all">All Types</option>
	    <option value="bunker">Bunker-C</option>
            <option value="diesel">Diesel</option>
          </select>
	</div>
      </fieldset>
      <div>
	<hr/>
        <p><small><b>Disclaimer:</b> The oil spill products shown are based on preliminary results of the MIDOSS Monte Carlo simulation for <nobr>n=723</nobr> spills in the boxed region of the northern Strait of Georgia. These results do not accurately depict oil spill risk in their current state and are for example visualization purposes only. See the <a href="#">Methodology</a> section for more information.</small></p>
      </div>
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