
const comment=(uid,vid)=>
{
let message = document.querySelector('.comment1');
let commentid=document.querySelector('.Comment');

if(message.value=="")
{
alert("Please Write Comment!");
return;
}
 
	let json={
		'vid':vid,
		"uid":uid,
		"message":message.value,
		"action":5
	}
	
	let query=new URLSearchParams(json);
	console.log(query.toString());
	fetch('/ApiServlet',{
	body:query,
	method:'POST',
	headers:{'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
	}
	
	}).then(  (resp) => {return resp.json();}).then( data => 
	{
	console.log(data.data)
	
	if(data.data=="true")
	{
	 let comments=`<div class="content d-flex pt-2 col-md-12">
                                <img src="images/icon.png" alt="user" class="img-fluid">
                                <div class="img-name d-flex flex-column">
                               
                                  <p class="text-dark text pl-3 mb-0"> ${message.value}</p>
                                <div class="col-md-6 like d-flex">
        
                                </div>
                                </div>
                             </div>`;
                        commentid.insertAdjacentHTML('afterbegin',comments)
	}
	}).catch( error => console.log(error))
	
}



let commentid=document.querySelector('.Comment');

let page =0,limit=1;
let count=2;
const getcomment =(page ,limit)=>
{


    console.log(page,limit);
    let d={
        
        "vid":"V20210301B",
        "page":page,
        "limit":limit,
        "action":6
    }
    let query=new URLSearchParams(d)
    console.log(query.toString());
fetch('/ApiServlet',{
    body:query,
    method:'POST',
    headers:{'Content-Type':'application/x-www-form-urlencoded; charset=UTF-8'
    }
  }).then(  (resp) => {return resp.json();}).then( data => 
{
console.log(data.data)
let ele=data.data;
    ele.forEach(element => {
    
    
        console.log(element.comment)
           let comments=`<div class="content d-flex pt-2 col-md-12">
                                <img src="images/icon.png" alt="user" class="img-fluid">
                                <div class="img-name d-flex flex-column">
                           	
                                  <p class="text-dark text pl-3 mb-0"> ${element.comment}</p>
                                <div class="col-md-6 like d-flex">
     
                                </div>
                                </div>
                             </div>`;
        
                         commentid.insertAdjacentHTML('beforeend',comments)
            
    });


}).catch( error => console.log(error))

}
getcomment(page,limit);

const morecomment=()=>
{
// page++;
limit=10;
console.log(count,page)
if(page==0)
{
page=1;
getcomment(page,limit)
return
}
page=  (count++)*10-10;
getcomment(page,limit)

}

    