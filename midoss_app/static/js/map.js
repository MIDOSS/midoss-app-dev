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

var data = new ol.source.XYZ({
    projection: 'EPSG:3857',
});

new ol.Map({
    target: 'map',
    layers: [
	canvas,
	topo,
	new ol.layer.Tile({source: data}),
    ],
    controls: ol.control.defaults().extend([new ol.control.ScaleLine()]),
    view: new ol.View({
	center: ol.proj.fromLonLat([-124, 49]),
	zoom: 7,
    }),
});

var VariableSelect = document.getElementById('variable');
VariableSelect.onchange = function () {
    data.setUrl("tiles" + `/${VariableSelect.value}` + `/${OiltypeSelect.value}` + "/{z}/{y}/{x}.png")
};

var OiltypeSelect = document.getElementById('oiltype');
OiltypeSelect.onchange = function () {
    data.setUrl("tiles" + `/${VariableSelect.value}` + `/${OiltypeSelect.value}` + "/{z}/{y}/{x}.png")
};

var TopoSelect = document.getElementById('topo-layer');
TopoSelect.onchange = function () {
    canvas.setVisible(!TopoSelect.checked)
    topo.setVisible(TopoSelect.checked)
};
