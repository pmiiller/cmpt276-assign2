//Lists of elements by class
var numerators = document.getElementsByClassName('gradeTop');
var denominators = document.getElementsByClassName('gradeBottom');
var weights = document.getElementsByClassName('weight');
var percents = document.getElementsByClassName('percent');

//Variable recording the total number of rows
var rows = 4;

function mean() {
  var total = 0;
  for(var i=0; i < numerators.length; i++) {
    if (numerators[i].value == '' || denominators[i].value == ''){
      return "Error: Empty field";
    }
    var numerator = parseFloat(numerators[i].value);
    var denominator = parseFloat(denominators[i].value);
    if (denominator == 0){
      return "Error: Dividing by 0";
    }
    if (denominator < 0 || numerator < 0){
      return "Error: Cannot have a negative score";
    }
    total += numerator/denominator;
  }
  var score = (total/4).toFixed(2);
  return score;
}

function weighted() {
  var total = 0;
  var weightTotal = 0;
  for (var i=0; i < weights.length; i++) {
    if (weights[i].value == ''){
      return "Error: Empty field";
    }
    var weight = parseFloat(weights[i].value);
    weightTotal += weight;
  }
  for (var i=0; i < numerators.length; i++) {
    if (numerators[i].value == '' || denominators[i].value == ''){
      return "Error: Empty field";
    }
    var numerator = parseFloat(numerators[i].value);
    var denominator = parseFloat(denominators[i].value);
    var weight = parseFloat(weights[i].value);
    if (denominator == 0){
      return "Error: Dividing by 0.";
    }
    if (denominator < 0 || numerator < 0){
      return "Error: Cannot have a negative score.";
    }
    if (weight <= 0){
      return "Error: Cannot have a negative or zero weight."
    }
    total += (numerator/denominator) * (weight/weightTotal) ;
  }
  var score = total.toFixed(2);
  return score;
}

function percent(number) {
  var index = parseInt(number) - 1;
  if (numerators[index].value == '' || denominators[index].value == ''){
    percents[index].innerHTML = "Error: Empty field";
    return;
  }
  var numerator = parseFloat(numerators[index].value);
  var denominator = parseFloat(denominators[index].value);
  if (denominator == 0){
    percents[index].innerHTML = "Error: Dividing by 0";
    return;
  }
  if (denominator < 0 || numerator < 0){
    percents[index].innerHTML = "Error: Cannot have a negative score";
    return;
  }
  var score = (numerator/denominator).toFixed(2);
  percents[index].innerHTML = score;
}

function clearAll() {
  document.getElementById("result").innerHTML = '&nbsp' ;
  for (var i=0; i < numerators.length; i++) {
    numerators[i].value = '';
  }
  for (var i=0; i < denominators.length; i++) {
    denominators[i].value = '';
  }
  for (var i=0; i < weights.length; i++) {
    weights[i].value = '';
  }
  for (var i=0; i < percents.length; i++) {
    percents[i].innerHTML = '';
  }
}

function newRow() {
  var table = document.getElementById("mainTable");
  rows++;
  var currentRow = rows;
  var row = table.insertRow(rows);
  var cell1 = row.insertCell(0);
  var cell2 = row.insertCell(1);
  var cell3 = row.insertCell(2);
  var cell4 = row.insertCell(3);
  var cell5 = row.insertCell(4);
  cell1.innerHTML = "Activity "+currentRow;
  cell2.innerHTML = "A"+currentRow;

  var weightElement = document.createElement("input");
  weightElement.type = "text";
  weightElement.className = "weight"
  weightElement.size = "2";
  cell3.appendChild(weightElement);

  var gradeTopElement = document.createElement("input");
  gradeTopElement.type = "text";
  gradeTopElement.className = "gradeTop";
  gradeTopElement.size = "2";
  if(window.Event) {
    gradeTopElement.onkeyup = function(event) { percent(currentRow) };
  } else {
    gradeTopElement.onkeyup = function() { return checkIterationError(this,5,5,event) };
  }
  cell4.appendChild(gradeTopElement);

  var slash = document.createElement("span");
  var node = document.createTextNode("/");
  slash.appendChild(node);
  cell4.appendChild(slash);

  var gradeBottomElement = document.createElement("input");
  gradeBottomElement.type = "text";
  gradeBottomElement.className = "gradeBottom";
  gradeBottomElement.size = "2";
  if(window.Event) {
    gradeBottomElement.onkeyup = function(event) { percent(currentRow) };
  } else {
    gradeBottomElement.onkeyup = function() { return checkIterationError(this,5,5,event) };
  }
  cell4.appendChild(gradeBottomElement);

  cell5.className = "percent";
}

function deleteRow() {
  if (rows > 1){
    document.getElementById("mainTable").deleteRow(rows);
    rows--;
  }
}
