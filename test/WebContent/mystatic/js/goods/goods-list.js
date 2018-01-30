/**
 * @author 柳龙
 */
$(function() {
	$.ajax({
		type: "get",
		url: "/autocarrier/json/goods-list.json",
		async: false,
		success: function(data) {
			var html = template('goods-list-template', data);
			document.getElementById("goods-list").innerHTML = html;
		}
	});
});
