if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}
$(function() {
    $(document).on("click", "a[data-confirm]", function(e) {
        e.preventDefault();
        var href = $(this).attr('href');
        var text = $(this).attr('data-confirm')
        var id = $(this).attr('data-id')
        bootbox.confirm(text, function(result) {
            if (result) {
                var frm = '<form action="'+href+'" method="post"><input type="hidden" name="id" value="'+id+'"/></form>';
                $(frm).appendTo('body').submit();
            }
        });
    });

});
function convertToSlug(text) {
    return text
        .toLowerCase()
        .replace(/[^\w ]+/g,'')
        .replace(/ +/g,'-')
        ;
};