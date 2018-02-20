var tooltip=function(){
	var id = 'tt';
	var top = 3;
	var left = 3;
	var maxw = 400;
	var speed = 10;
	var timer = 20;
	var endalpha = 100;
	var alpha = 0;
	var tt,t,c,b,h;
	var ie = document.all ? true : false;
	return{
		show:function(v,w){
			if(tt == null){
				tt = document.createElement('div');
				tt.setAttribute('id',id);
				t = document.createElement('div');
				t.setAttribute('id',id + 'top');
				c = document.createElement('div');
				c.setAttribute('id',id + 'cont');
				b = document.createElement('div');
				b.setAttribute('id',id + 'bot');
				tt.appendChild(t);
				tt.appendChild(c);
				tt.appendChild(b);
				document.body.appendChild(tt);
				tt.style.opacity = 0;
				tt.style.filter = 'alpha(opacity=0)';
				document.onmousemove = this.pos;
			}
			tt.style.display = 'block';
			c.style.border='1px solid black';
			c.innerHTML = v;
			tt.style.width = w ? w + 'px' : 'auto';
			if(!w && ie){
				t.style.display = 'none';
				b.style.display = 'none';
				tt.style.width = tt.offsetWidth;
				t.style.display = 'block';
				b.style.display = 'block';
			}
			if(tt.offsetWidth > maxw){tt.style.width = maxw + 'px'}
			h = parseInt(tt.offsetHeight) + top;
			clearInterval(tt.timer);
			tt.timer = setInterval(function(){tooltip.fade(1)},timer);
		},
		pos:function(e){
			var u = ie ? event.clientY + document.documentElement.scrollTop : e.pageY;
			var l = ie ? event.clientX + document.documentElement.scrollLeft : e.pageX;
			tt.style.top = (u) + 'px';
			tt.style.left = (l + left) + 'px';
		},
		fade:function(d){
			var a = alpha;
			if((a != endalpha && d == 1) || (a != 0 && d == -1)){
				var i = speed;
				if(endalpha - a < speed && d == 1){
					i = endalpha - a;
				}else if(alpha < speed && d == -1){
					i = a;
				}
				alpha = a + (i * d);
				tt.style.opacity = alpha * .01;
				tt.style.filter = 'alpha(opacity=' + alpha + ')';
			}else{
				clearInterval(tt.timer);
				if(d == -1){tt.style.display = 'none'}
			}
		},
		hide:function(){
			clearInterval(tt.timer);
			tt.timer = setInterval(function(){tooltip.fade(-1)},timer);
		}
	};
}();

function ShowDiv(e, text)
{

  // Get the click location
  var height = e.clientY + parseInt('5'); //alert("height="+height);
  // Get the height inside the clicked image
  var offsetHeight = parseInt(e.offsetY); //alert("offsetHeight="+offsetHeight);
  height = height - offsetHeight;

  // Get the click location(width)
  var width = e.clientX; //alert("width="+width);
  // Get the width inside the clicked image
  var offsetWidth = parseInt(e.offsetX); //alert("offsetWidth="+offsetWidth);
  width = width - offsetWidth;
  
  var div = document.getElementById('Tooltip');
  div.style.position = 'absolute';

  // Set the div top to the height 
  var nr1=0;
  nr1=parseInt(height) + parseInt('5');
  div.style.top = parseInt(height) + parseInt('5'); //alert("nr1="+nr1);

  // Set the div Left to the height 
  var nr2=0;
  nr2= (parseInt(width) + parseInt('50'));
  div.style.left = parseInt(width) + parseInt('50'); //alert("nr2="+nr2);
  
  // Show the div layer
  div.style.display = 'block';

  // Set its Text to your desired text
  div.innerHTML = text;

 var mytable = document.getElementById('detail');
 //alert(mytable.clientHeight);
 if (mytable.clientHeight < 200)
 {
   div.style.height = mytable.clientHeight+1;
 }
 
 //div.scrollTo( div.style.top, div.style.left);
	
}

var indiv=false;

function hideDiv()
{
//if (top.indiv)
{
 var div = document.getElementById('Tooltip');
 div.style.display='none';
}
}

function showLastDiv()
{
//if (top.indiv)
{
 var div = document.getElementById('Tooltip');
 div.style.display='block';
}
}

function confirmUnsavedChanges() {
	if (confirm("You have unsaved changes in this page. Are you sure you want to leave page?")) {
		return true;
	} 
	return false;
}