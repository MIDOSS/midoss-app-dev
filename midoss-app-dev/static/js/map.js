var canvas = new ol.source.XYZ({
    url: "https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",
    projection: 'EPSG:3857',
});

var data = new ol.source.XYZ({
    url: "tiles/temperature/{z}/{y}/{x}.png",
    projection: 'EPSG:3857',
});

var tilegrid = new ol.source.TileDebug({
    tileGrid: canvas.getTileGrid(),
    projection: 'EPSG:3857',
});

new ol.Map({
    target: 'map',
    layers: [
	new ol.layer.TileLayer({
	    source: canvas,
	}),
	new ol.layer.TileLayer({
	    source: data,
	}),
	//new ol.tile.TileLayer({
	//    source: tilegrid,
	//}),
    ],
    view: new ol.View({
	center: ol.proj.fromLonLat([-124, 49]),
	zoom: 7,
    })
});

var VariableSelect = document.getElementById('variable');
VariableSelect.onchange = function () {
    var new_variable = VariableSelect.value
    data.setUrl("tiles/"+new_variable+"/{z}/{y}/{x}.png")
};
