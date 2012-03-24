function getSelectPos(obj){
	var esrc = document.getElementById(obj);
	if(esrc==null){
		esrc=event.srcElement;
	}
	var rtextRange =esrc.createTextRange();
	rtextRange.moveStart('character',esrc.value.length);
	rtextRange.collapse(true);
	rtextRange.select();
}
function setMenu (id) {
	var obj=document.getElementById(id);
	if(obj.style.display == "" ){
		obj.style.display="none";
		event.srcElement.style.backgroundColor="#c2dceb";
		}else{
		obj.style.display="";
		event.srcElement.style.backgroundColor="#ddeff9";
		}
}
function setLeftBg(type){
	if(type ==	1){
		event.srcElement.style.backgroundColor="#ffffff";
		}else{
		event.srcElement.style.backgroundColor="";
	}
}