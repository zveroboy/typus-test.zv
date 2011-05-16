jQuery(document).ready(function() {
	$('a[rel="external"]').click( function() {
        window.open( $(this).attr('href') );
        return false;
    });
	$('#mycarousel').jcarousel({
		// wrap: 'circular'
	});
	$('#category_selector li').click(function(){
		$(this).parent().find('li').not(this).removeClass('selected');
		$(this).toggleClass('selected');
	});
	$('#link_to_sites').click(function(e){
		var p = {};
		$('#lang_selector input:checked').add('#category_selector li.selected input:hidden').each(function(){
			if(!p[this.name]) p[this.name] = [];
			p[this.name].push(this.value);
		});
		
		window.location = $(this).attr("href") + "?" + $.param(p); 
		e.preventDefault();
		return false;
	});
	$("#star_rating").stars({
		inputType: "select",
		cancelShow: false
	}).click(function(){
		$.fancybox.showActivity();

		$.ajax({
			type: "GET",
			cach: false,
			url: "/sign_in",
			success: function(data) {
				$.fancybox(data);
			}
		});
	});
	$(".rate").stars({
		inputType: "select",
		cancelShow: false
	});
});