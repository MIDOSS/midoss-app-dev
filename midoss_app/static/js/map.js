var canvas = new ol.source.XYZ({
    url: "https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Dark_Gray_Base/MapServer/tile/{z}/{y}/{x}",
    projection: 'EPSG:3857',
});

var data = new ol.source.XYZ({
    //url: "tile/temperature/{z}/{y}/{x}.png",
    projection: 'EPSG:3857',
});

var tilegrid = new ol.source.TileDebug({
    tileGrid: canvas.getTileGrid(),
    projection: 'EPSG:3857',
});

new ol.Map({
    target: 'map',
    layers: [
	new ol.layer.Tile({
	    source: canvas,
	}),
	new ol.layer.Tile({
	    source: data,
	}),
	new ol.layer.Tile({
	    source: tilegrid,
	}),
    ],
    view: new ol.View({
	center: ol.proj.fromLonLat([-124, 49]),
	zoom: 7,
    })
});

var VariableSelect = document.getElementById('variable');
VariableSelect.onchange = function () {
    data.setUrl("tiles" + `/${VariableSelect.value}` + "/{z}/{y}/{x}.png")
};
