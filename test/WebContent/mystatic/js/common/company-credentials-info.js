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

$("#datetimepicker").on("click",function(e){
		e.stopPropagation();
		$(this).lqdatetimepicker({
			css : 'datetime-day',
			dateType : 'D',
			selectback : function(){

			}
		});

});