/*
 * @author 柳龙
 */
"use strict";
var $table = $('#table');
var rows = [];
var index_id = 0;
$(function() {
	$("#header").load('index-top.html');
	$("#footer").load('index-buttom.html');
});

$('form').validate({
	onFocus: function() {
		this.removeClass('error');
		return false;
	},
	onBlur: function() {
		var _status = parseInt(this.attr('data-status'));
		if(!_status) {
			this.removeAttr('placeholder');
			this.addClass('error');
			this.tooltip('show');
			this.focus();
		} else {
			this.tooltip('destroy');
		}

		return false;
	}
});
$('form').on('submit', function(event) {
	event.preventDefault();
	$(this).validate('submitValidate'); //return boolean;

});
/**
 * 点击出发地input打开省市区选择面板
 */
$('#ip_address_from').click(function() {
	$('#ip_address_from').citypicker('open');
});
/**
 * 点击目的地input打开省市区选择面板
 */
$('#ip_address_to').click(function() {
	$('#ip_address_to').citypicker('open');
});
/**
 * 在货物信息中添加一行空白的信息
 */
/*function addCargoInfo() {
	$table.bootstrapTable('load', rowData());
	$table.bootstrapTable('scrollTo', 'bottom');
}*/
/**
 * 需要添加的货物信息空白的数据
 */
/*function rowData() {
	index_id++;
	rows.push({
		index_id: index_id,
		description_of_goods: '<input name="description_of_goods" onBlur="test()" type="text" value="1">',
		cargo_type_classification: '<input name="cargo_type_classification" type="text" value="">',
		total_number_of_packages: '<input name="total_number_of_packages" type="text" style="width:90px;" value="">',
		package_type: '<input name="package_type" type="text" value="">',
		weight_of_goods: '<input name="weight_of_goods" type="text" value="">',
		cube_of_goods: '<input name="cube_of_goods" type="text" value="">'
	});
	return rows;
}*/
//移除货物信息中的行
function removeCargoInfo() {
	var rows = $table.bootstrapTable('getSelections');
	var ids = [];
	$.each(rows, function(index,row) {
		ids.push(row.index_id);
	});
	console.log(ids);
	$table.bootstrapTable('remove', {
		field: 'index_id',
		values: ids
	});
}

function formatter(value, row, index) {
	return index + 1;
}

function openModal(){
	var tempid = rows.length+1;
	$("input[name='index_id']").val(tempid);
	$("#myModal").modal('toggle');
}
function saveData(){
	var data = $("#goodsInfo").serializeJSON();
	rows.push(data);
	console.log(rows);
	$table.bootstrapTable('load',rows);
}
