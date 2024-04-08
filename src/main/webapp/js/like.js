const like=(vid,uid,servicename)=>
{
console.log("likes",vid,uid,servicename);

let d={
	  action:"1",
	 uid:uid,
     vid:vid,
    servicename:servicename
     }



$.ajax({
		type:"POST",
		url:"/ApiServlet",
		headers: {
         'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        },
		data:d,
		
		success : function(res)
		{
			console.log(res)
				console.log(typeof res)
			if(res=='true')
			{
				let count=$('#lcount').html();
				count++;
				$('#lcount').html(count);
				document.getElementByClassName('likeicon').style.color="blue";
			}
		}
	})
	let icon=document.getElementByClassName("fas");
	icon.style.color="red";
}







