$(document).ready(function() {
	let sc = document.getElementById("Search");
	let sel = sc.value; 
	sc.addEventListener("change", function(e) {
		
		sc = e.target.value;
		
		sel = sc;
		
		if(e.target.value == "community"){
			$("#autocomplete").attr('readonly',true);
		}else{
			$("#autocomplete").attr('readonly',false);
		}
		//alert(select);
		//값이 바뀔때마다 찍힘
	});

	$( "#autocomplete" ).autocomplete({
			
        source : function( request, response ) {
            $.ajax({
                url: "autoSearch.do?SC="+sel,
                dataType: "json",
                data: {
                  searchKeyword: request.term,
                  SC : request
                },
                success: function( result ) {
                    response( 
                        $.map( result, function( item ) {
 
                                return {
                                      label: item.data,
                                      value: item.data,
                                      test: item.value
                                }
                          })
                      );
                }
              });
        },
        select: function( event, ui ) {
       
        $('#moviecode').val(ui.item.test);
        },
        minLength: 1
        
    });
});


