
let d;
const vidviews = (vid, uid,servicename) => {
console.log("vid :", vid, uid);
d = {
		'action': "2",
		'uid': uid,
		'vid': vid,
		'servicename':servicename
	}
}

			let ll=videojs("my-video");
			
			let durat=document.querySelector('video')
			
			let getduration=1;
			let currenttime=0;
			console.log(currenttime);
			
			durat.addEventListener('loadedmetadata',()=> { 
			    getduration=  Math.floor(durat.duration);
			   
			    const duration = moment.duration(getduration, 'seconds');
				const m = duration.minutes(); // 20
				const s = duration.seconds(); // 25
                  
//                  document.getElementById('vtime').innerHTML=`${m}:${s}`
				
			});
			
			 mytime=()=>
			{
			
			    if(Math.floor(ll.currentTime())  >= getduration/2)
			    {
				
				getduration*=Math.floor(ll.currentTime());
			       console.log(getduration,currenttime);
			       console.log("Enter in if");
			
				$.ajax({
					type: "POST",
					url: "/ApiServlet",
					headers: {
						'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
					},
					data: d,
			
					success: function(res) {
						console.log(res)
						console.log(typeof res)
						
					}
			
				})
			
			
			      
			       
			   }
			}
			
			let tu=document.getElementById('vtouch');
			
		
			tu.on('touchstart',()=>
			{
			    if(ll.paused()){
			        ll.play();
			    }
			    else{
			        ll.pause();
			    }
			})


// ll.on('timeupdate',()=>{  
   
//     if(Math.floor(ll.currentTime())  >=getduration)
//  {
//     console.log(getduration,currenttime);
    
//     console.log("Enter in if");
    
// }
//   })




