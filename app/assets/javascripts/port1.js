$(document).ready(function(){
	
	$('.comment_close').click(function(){
		$(this).removeClass('open');
		$('.comment_open').addClass('open');
	});
	$('.comment_open').click(function(){
		$(this).removeClass('open');
		$('.comment_close').addClass('open');
	});
});