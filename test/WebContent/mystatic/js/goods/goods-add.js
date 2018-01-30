/*
 * @author 柳龙
 */
"use strict";
var $table = $('#table');
var $row = [];
var index_id = 0;
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

//移除货物信息中的行
function removeCargoInfo() {
	var rows = $table.bootstrapTable('getSelections');
	var ids = [];
	$.each(rows, function(index, row) {
		ids.push(row.index_id);
	});
	console.log(ids);
	$table.bootstrapTable('remove', {
		field: 'index_id',
		values: ids
	});
}
/*格式化序号*/
function formatterIndex(value, row, index) {
	return index + 1;
}

/*打开货物信息增加模态框*/
function openModal() {
	$("input[name='index_id']").val(++index_id);
	$("#myModal").modal('toggle');
	$("input[name='description_of_goods']").focus();
}
var flag = true;
function saveData() {

	var loadIndexid = $("input[name='index_id']").val();
	var data = $("#goodsInfo").serializeJSON();
	if(!flag){
		$table.bootstrapTable('removeByUniqueId', loadIndexid);
	}
	$row.push(data); //将数据保存到变量中
	$table.bootstrapTable('load', $row); //加载数据
	if(flag) {
		$("#goodsInfo")[0].reset(); //重置form表单
		$("input[name='index_id']").val(++index_id);
		$("input[name='description_of_goods']").focus();
	}else{
		$('#myModal').modal('toggle');
	}
}
/*添加货物信息是监听enter键按下事件*/
$("#goodsInfo").keydown(function() {
	if(event.keyCode == "13") { //keyCode=13是回车键
		saveData();
	}
});

function editCargoInfo() {
	var row = $table.bootstrapTable('getSelections')[0];
	var data = $table.bootstrapTable('getRowByUniqueId', row.index_id);
	$("#myModal").modal('toggle');
	$("#goodsInfo").setForm(data);
	flag = false;
}