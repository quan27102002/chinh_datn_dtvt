import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime today = DateTime.now();
  CalendarFormat format = CalendarFormat.week;
  late DateTime selectedDay;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('vi_VN', null);
    selectedDay = today;
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarStyle: const CalendarStyle(tablePadding: EdgeInsets.zero),
      focusedDay: today,
      locale: 'vi_VN',
      calendarFormat: format,
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      selectedDayPredicate: (DateTime date) {
        // Compare to check if date is today or the selected day
        return isSameDay(date, today);
      },
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          this.selectedDay = selectedDay;
        });
        // You can add additional actions here when a day is selected
      },
      headerStyle: HeaderStyle(
        titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        formatButtonTextStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        leftChevronIcon: Icon(Icons.chevron_left),
        rightChevronIcon: Icon(Icons.chevron_right),
      ),
      headerVisible: false,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        weekendStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
      daysOfWeekHeight: 40,
    );
  }
}
