/*
 * @author  Mr.w (魏凯)
 */
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
$('#ip_address_home').click(function() {
	$('#ip_address_home').citypicker('open');
});

$('#ip_address_bank').click(function() {
	$('#ip_address_bank').citypicker('open');
});


$("#datetimepicker").on("click",function(e){
		e.stopPropagation();
		$(this).lqdatetimepicker({
			css : 'datetime-day',
			dateType : 'D',
			selectback : function(){

			}
		});

});

 
$("#submit").click(function(){
	//alert($("form").serialize())
	$("form").submit()
	
});
