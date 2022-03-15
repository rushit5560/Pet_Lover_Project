import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../common/constants/app_colors.dart';
import '../../controllers/set_reminder_screen_controller/set_reminder_screen_controller.dart';

class TableCalender extends StatefulWidget {
  const TableCalender({Key? key}) : super(key: key);
  @override
  _TableCalenderState createState() => _TableCalenderState();
}
class _TableCalenderState extends State<TableCalender> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      color: AppColors.colorLightBlue,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TableCalendar(
          focusedDay: focusedDay,
          firstDay: DateTime(2020),
          lastDay: DateTime(2050),
          calendarFormat: format,
          rangeStartDay: DateTime.now(),
          onDaySelected: (DateTime selectDay, DateTime focusDay) {
            setState(() {
              selectedDay = selectDay;
              focusedDay = focusDay;
            });
            print('\nselectedDay :: $selectedDay');
            print('focusedDay :: $focusedDay\n');
          },

          // Day Changed
          selectedDayPredicate: (DateTime date) {
            return isSameDay(selectedDay, date);
          },
          // Style the Calender
          calendarStyle: CalendarStyle(
            isTodayHighlighted: false,
            outsideDecoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            defaultTextStyle: TextStyle(
                color: AppColors.colorDarkBlue1, fontWeight: FontWeight.bold),
            weekendTextStyle: TextStyle(
                color: AppColors.colorDarkBlue1, fontWeight: FontWeight.bold),
            selectedTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            todayTextStyle: TextStyle(
                color: AppColors.colorDarkBlue1, fontWeight: FontWeight.bold),
            defaultDecoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            weekendDecoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            todayDecoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.transparent),
            selectedDecoration: BoxDecoration(
                shape: BoxShape.circle, color: AppColors.colorDarkBlue1),
          ),
          // Week Style
          daysOfWeekStyle: DaysOfWeekStyle(
            // dowTextFormatter: (dowTextFormat, dynamic) {
            //   return DateFormat.E(locale).format(dowTextFormat)[0];
            // },
            decoration: BoxDecoration(color: AppColors.colorLightBlue),
            weekdayStyle: TextStyle(
                color: AppColors.colorDarkBlue1, fontWeight: FontWeight.bold, fontSize: 15),
            weekendStyle: TextStyle(
                color: AppColors.colorDarkBlue1, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          // Month Style
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            decoration: BoxDecoration(color: AppColors.colorDarkBlue1),
            formatButtonDecoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
            titleTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            leftChevronIcon:
                const Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
            rightChevronIcon: const Icon(Icons.arrow_forward_ios_rounded,
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class SetTimeModule extends StatelessWidget {
  SetTimeModule({Key? key}) : super(key: key);
  final screenController = Get.find<SetReminderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.colorDarkBlue1.withOpacity(0.1),
            offset: const Offset(0, 5),
            blurRadius: 3,
            spreadRadius: 0.1,
            // blurStyle: BlurStyle.outer
          )
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
        child: Column(
          children: [
            Text(
              'Set Time',
              style: TextStyle(
                color: AppColors.colorDarkBlue1,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    selectHrFromList(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.colorDarkBlue1.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 1,
                            blurStyle: BlurStyle.outer)
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 18),
                      child: Obx(
                        () => Text(
                          "${screenController.selectedHr.value}",
                          style: TextStyle(
                            color: AppColors.colorDarkBlue1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  ':',
                  style: TextStyle(
                    color: AppColors.colorDarkBlue1,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: () {
                    selectMinutesFromList(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.colorDarkBlue1.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 18),
                      child: Obx(
                        () => Text(
                          '${screenController.selectedMinute.value}',
                          style: TextStyle(
                            color: AppColors.colorDarkBlue1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 25),
                GestureDetector(
                  onTap: () {
                    if (screenController.isAmSelected.value == true) {
                      screenController.amPmText.value = 'PM';
                    } else if (screenController.isAmSelected.value == false) {
                      screenController.amPmText.value = 'AM';
                    }
                    screenController.isAmSelected.value =
                        !screenController.isAmSelected.value;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.colorDarkBlue1.withOpacity(0.2),
                              blurRadius: 5,
                              spreadRadius: 1,
                              blurStyle: BlurStyle.outer)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 18),
                      child: Obx(
                        () => Text(
                          '${screenController.amPmText}',
                          style: TextStyle(
                            color: AppColors.colorDarkBlue1,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void selectHrFromList(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        backgroundColor: AppColors.colorLightBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        builder: (context) {
          return SizedBox(
            height: Get.height * 0.50,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    List.generate(screenController.hoursList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      screenController.selectedHr.value =
                          screenController.hoursList[index];
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${screenController.hoursList[index]}',
                        style: TextStyle(
                          color: AppColors.colorDarkBlue1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        });
  }

  void selectMinutesFromList(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        backgroundColor: AppColors.colorLightBlue,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        builder: (context) {
          return SizedBox(
            height: Get.height * 0.50,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                    List.generate(screenController.minutesList.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      screenController.selectedMinute.value =
                          screenController.minutesList[index];
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${screenController.minutesList[index]}',
                        style: TextStyle(
                          color: AppColors.colorDarkBlue1,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        });
  }
}

class RepeatModule extends StatelessWidget {
  const RepeatModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.colorDarkBlue1.withOpacity(0.2),
                  blurRadius: 3,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.outer
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Repeat',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.colorDarkBlue,
                  fontSize: 13,
                ),
              ),

              Container(
                child: Row(
                  children: [
                    Text(
                      'One Time',
                      style: TextStyle(
                        color: AppColors.colorDarkBlue.withOpacity(0.5),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.colorDarkBlue1.withOpacity(0.5),
                      size: 18,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SaveButtonModule extends StatelessWidget {
  SaveButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<SetReminderScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('${screenController.selectedHr}');
        print('${screenController.selectedMinute}');
        print('${screenController.amPmText}');
      },
      child: Container(
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkBlue1,
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            'SAVE',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
