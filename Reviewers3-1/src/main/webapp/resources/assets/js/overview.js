$(document).ready(function() {
	let code = document.getElementById("moviecode");
	let codename = code.value; 
	code.addEventListener("change", function(e) {
	
		code = e.target.value;
		codename = code;
		
	});
	
	$("moviecode").on('change', function() {
		console.log(1);
		$.ajax({
			url:"",
			data: codename,
			success: function(result){
				console.log("미리보기 성공");
				return 
			}
		})
	})
});



