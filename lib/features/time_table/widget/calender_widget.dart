import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class CustomCalendar extends StatefulWidget {
  final List<int> classDays; // List of weekdays with classes (1 = Monday, 2 = Tuesday, ..., 7 = Sunday)

  const CustomCalendar({super.key, required this.classDays});

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2024, 1, 1),
          lastDay: DateTime.utc(2030, 12, 31),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
          calendarStyle:  CalendarStyle(
            todayTextStyle: TextStyle(color: Colors.black),
            cellMargin: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            todayDecoration: BoxDecoration(
              border: Border.all(color:Colors.blue, ),
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
          ),
          headerStyle: const HeaderStyle(titleTextStyle: TextStyle(color: Colors.black),
            formatButtonVisible: false,
            titleCentered: true,
            leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
            rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekendStyle: TextStyle(color: Colors.black),
            weekdayStyle: TextStyle(color: Colors.black),
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              if (widget.classDays.contains(day.weekday)) {
                return Center(
                  child: Stack(alignment: Alignment.center,
                    children: [
                      Positioned(top:20,
                        child: Center(
                          child: Text(
                            day.day.toString(),
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Positioned( bottom:1,
                        child: Container(
                          margin: EdgeInsets.all(6.0),
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue,
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container(
                  margin: EdgeInsets.all(6.0),
                  width: 20,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Center(
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}


