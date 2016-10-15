//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function()
    {
        $("#myTable").tablesorter();
    }
);


function showDiv(id) {
   document.getElementById(id).style.display = "block";
   if (id != 'nameDiv'){
    document.getElementById('nameDiv').style.display = "none";
   }
   if (id != 'weightDiv'){
    document.getElementById('weightDiv').style.display = "none";
   }
   if (id != 'heightDiv'){
    document.getElementById('heightDiv').style.display = "none";
   }
   if (id != 'flyDiv'){
    document.getElementById('flyDiv').style.display = "none";
   }
   if (id != 'fightDiv'){
    document.getElementById('fightDiv').style.display = "none";
   }
   if (id != 'fireDiv'){
    document.getElementById('fireDiv').style.display = "none";
   }
   if (id != 'waterDiv'){
    document.getElementById('waterDiv').style.display = "none";
   }
   if (id != 'electricDiv'){
    document.getElementById('electricDiv').style.display = "none";
   }
   if (id != 'iceDiv'){
    document.getElementById('iceDiv').style.display = "none";
   }
   if (id != 'totalDiv'){
    document.getElementById('totalDiv').style.display = "none";
   }
   if (id != 'trainerDiv'){
    document.getElementById('trainerDiv').style.display = "none";
   }
}
