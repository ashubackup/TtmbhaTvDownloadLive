
<footer class="py-3">
	<div class="cuscontainer">
		<div class="rounded-sm footer-inner py-3">
			<div class="text-center">
				<!-- <a href="/" class="footer-logo"><img src="images/logo.png" alt="logo" class="img-fluid" /></a> -->
	<p class="mb-0"><span id="year"></span> &copy;TT MBHA TV| <a class="text-white text-decoration-none" href="ttmbha.html">Privacy Policy</a></p>
				
			</div>
		</div>
	</div>
</footer>
<script>

	function date() {
		var d = new Date();
		var n = d.getFullYear();
		document.getElementById("year").innerHTML = n;
	}
	date();
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script type="text/javascript">
$( document ).ready(function() {
    console.log( "ready!" );
    $("img").each(function() {
        
        $(this).attr("data-src",$(this).attr("src"));
        //$(this).removeAttr("src");
        console.log($(this)[0].outerHTML);
    });
});
</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://vjs.zencdn.net/7.10.2/video.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/like.js"></script>
<script src="js/custom.js"></script>
<script src="js/viewscount.js"></script>
<script src="js/watchlist.js"></script>
<script>
	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
</script>