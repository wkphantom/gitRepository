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
