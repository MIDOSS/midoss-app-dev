var canvas = new ol.layer.Tile({
    source: new ol.source.XYZ({
        url: "https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",
        projection: 'EPSG:3857',
	attributions: "© Esri, HERE, Garmin, OpenStreetMap contributors, and the GIS user community",
    }),
});

var topo = new ol.layer.Tile({
    source: new ol.source.XYZ({
        url: "https://server.arcgisonline.com/ArcGIS/rest/services/Ocean/World_Ocean_Base/MapServer/tile/{z}/{y}/{x}",
        projection: 'EPSG:3857',
	attributions: "© Esri, GEBCO, NOAA, Garmin, HERE, and other contributors",
    }),
});

//var tilegrid = new ol.layer.Tile({
//    source: new ol.source.TileDebug({
//        projection: 'EPSG:3857',
//    }),
//});

var datasource = new ol.source.XYZ({
    projection: 'EPSG:3857',
});

var data = new ol.layer.Tile({
    source: datasource,
})

new ol.Map({
    target: 'map',
    layers: [
	canvas,
	topo,
	data,
    ],
    controls: ol.control.defaults().extend([new ol.control.ScaleLine()]),
    view: new ol.View({
	center: ol.proj.fromLonLat([-124, 49]),
	zoom: 7,
    }),
});

// -- Identify selection objects --
// Layers
var TopoSelect = document.getElementById('topo-layer');
var DataSelect = document.getElementById('midoss-layer');

// Data categories
var VariableSelect = document.getElementById('variable');
var OiltypeSelect = document.getElementById('oiltype');

// -- Initialize selections --
// Layers
canvas.setVisible(!TopoSelect.checked)
topo.setVisible(TopoSelect.checked)
data.setVisible(DataSelect.checked)

// Data source
datasource.setUrl("tiles" + `/${VariableSelect.value}` + `/${OiltypeSelect.value}` + "/{z}/{y}/{x}.png")

// -- Handle changes --
// Layers
TopoSelect.onchange = function () {
    canvas.setVisible(!TopoSelect.checked)
    topo.setVisible(TopoSelect.checked)
};
DataSelect.onchange = function () {
    data.setVisible(DataSelect.checked)
};

// Data categories
VariableSelect.onchange = function () {
    datasource.setUrl("tiles" + `/${VariableSelect.value}` + `/${OiltypeSelect.value}` + "/{z}/{y}/{x}.png")
};
OiltypeSelect.onchange = function () {
    datasource.setUrl("tiles" + `/${VariableSelect.value}` + `/${OiltypeSelect.value}` + "/{z}/{y}/{x}.png")
};
