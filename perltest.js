const getAppointments = query => console.log('ready');


$( document ).ready( getAppointments );


let form = document.querySelector('#addForm');

form.addEventListener('submit', function (event) {
  event.preventDefault();
}, false);



function displayAdd(){
  document.querySelector('#new_btn').style = 'display: none';
  document.querySelector('#add_btn').style = 'display: inline';
  document.querySelector('#cancel_btn').style = 'display: inline';
  document.querySelector('#addForm').style = 'display: inline';
}

function cancelAdd(){
  document.querySelector('#new_btn').style = 'display: inline';
  document.querySelector('#add_btn').style = 'display: none';
  document.querySelector('#cancel_btn').style = 'display: none';
  document.querySelector('#addForm').style = 'display: none';
}

function addAppt(){
  if (form.checkValidity()) {
    form.submit();
  }
  else {
    form.querySelector('input[type="submit"]').click();
  }

  let description = document.querySelector('#desc').value;
  console.log(description);


}