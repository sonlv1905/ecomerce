$(function() {
    // Side Bar Toggle
    $('.hide-sidebar').click(function() {
	  $('#sidebar').hide('fast', function() {
	  	$('#content').removeClass('span9');
	  	$('#content').addClass('span12');
	  	$('.hide-sidebar').hide();
	  	$('.show-sidebar').show();
	  });
	});

	$('.show-sidebar').click(function() {
		$('#content').removeClass('span12');
	   	$('#content').addClass('span9');
	   	$('.show-sidebar').hide();
	   	$('.hide-sidebar').show();
	  	$('#sidebar').show('fast');
	});
});

$(document).ready(function () {
	try {
		initEvents();
	} catch (e) {
		alert('ready: ' + e.message);
	}
});

function initEvents(){
	/*$('#').on('click', function(){
        $('#form-order').submit(function(ev){
            ev.preventDefault();
            try {
                $.ajax({
                    type:'post',
                    url : '/master/z003/create',
                    dataType: 'json',
                    loading: true,
                    data: $('#form-order').serialize(),
                    success: function(res){
                        console.log(res)
                        console.log(res.status=="200");
                        if(res.status=="200"){
                            window.location.reload();
                        }               
                    }
                })
            } catch (e) {
                alert('' + e.message);
            }
        })
                        
    })*/
    var getAll = function getListContent() {
        try {
            var data = {};
            $.ajax({
                type: 'POST',
                url: '/master/z003/getAll',
                dataType: 'html',
                loading: true,
                data: data,
                success: function (res) {
                    $("#orders").empty();
                    $("#orders").append(res);
                },
                // Ajax error
                error: function (res) {
                }
            });
        } catch (e) {
            alert('' + e.message);
        }
    }    
   
    
    $('#get-all-order').on('click', function(){
        try {
        	var data = {};
        	$("#order-list").empty();
            $.ajax({
                type:'GET',
                url : 'http://localhost:8008/master/z003/getOrders',
                success: function(res){
                	console.log(res);
                	for(var i=0;i<res.length;i++){
                		$("#order-list").append(`               		
	                		<tr class="gradeA odd">
								<td class="  sorting_1">${res[i].name}</td>
								<td class=" ">${res[i].phone}</td>
								<td class=" ">${res[i].address}</td>
								<td class="center ">${res[i].email}</td>
								<td class="center ">${res[i].quantity}</td>
								<td class="center ">${res[i].total}</td>
								<td class="center ">
									<button class="btn btn-success btn-mini">Edit</button>
									<a href="/remove-order/${res[i].id}" class="btn btn-danger btn-mini" onclick="return confirm('Are you sure ?')">Delete</a>
								</td>
							</tr>
                		`);
                	}
					                   
                }
            })
         	/*$("#order-list").empty();*/
        } catch (e) {
            alert('' + e.message);
        }
                        
    })
     
}