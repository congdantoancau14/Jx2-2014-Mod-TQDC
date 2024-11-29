window.onload = function(){
	// removeClass('a','active');
};

document.addEventListener('click', function handleClick(event) {
  event.target.classList.add('active');
});

function removeClass(element_name, class_name) {
  var element = document.getElementsByTagName(element_name);
  element[0].classList.remove(class_name);
}