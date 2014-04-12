$(document).ready(function(){
	$("#title_search").autocomplete({
		source: $("#title_search").data('autocomplete'),
		select: function( event, ui ) { 
      window.location.href = ui.item.value;
    }
	});
});