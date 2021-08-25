const navigation = documen.querySelector('.navigation1');
document.querySelector('.toggle1').ondblclick = function() {
	this.classList.toggle('active1');
	navigation.classList.toggle('active1')
}



$(function() {
			$(".navigation1").draggable();
		});