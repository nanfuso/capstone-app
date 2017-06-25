// var datesAndTimes = {};

//     for (var i = 0; i < Shift.all.length, i ++) {
//             shift = Shift.all[i]
//         datesAndTimes['shift.shift_date'] = ['shift.time'];
//     }

// function changeShiftDetails() {
//     var shiftList = document.getElementById("shift");
//     var shiftTimeList = document.getElementById("shift_time");
//     var selShift = shiftList.options[shiftList.selectedIndex].value;
//     while (shiftTimeList.options.length) {
//         shiftTimeList.remove(0);
//     }
//     var shifts = datesAndTimes[selShift];
//     if (shifts) {
//         var i;
//         for (i = 0; i < shifts.length; i++) {
//             var shift = new Option(shifts[i], i);
//             shiftTimeList.options.add(shift);
//         }
//     }
// } 