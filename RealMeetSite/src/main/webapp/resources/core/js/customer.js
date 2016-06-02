// Get the modal
var modal = document.getElementByClassName('modal-content');

//// Get the button that opens the modal
//var a = document.getElementById("modal");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//// When the user clicks the button, open the modal 
modal.onclick = function open() {
    modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
    modal.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.display = "none";
    }
}