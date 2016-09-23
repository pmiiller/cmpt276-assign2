function retrieve(id) {
    var txtbox = document.getElementById(id);
    var value = txtbox.value;
    return value;
}

function mean() {
    var grade1 = document.getElementById('gradeTop1').value / document.getElementById('gradeBottom1').value;
    var grade2 = document.getElementById('gradeTop2').value / document.getElementById('gradeBottom2').value;
    var grade3 = document.getElementById('gradeTop3').value / document.getElementById('gradeBottom3').value;
    var grade4 = document.getElementById('gradeTop4').value / document.getElementById('gradeBottom4').value;
    return (grade1 + grade2 + grade3 + grade4)/4;
}
