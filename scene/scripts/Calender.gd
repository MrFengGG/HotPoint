extends Reference

const MINUTES_IN_HOUR = 60
const HOUR_IN_DAY = 24
const DAY_IN_MONTH = 30
const MONTH_IN_YEAR = 12

var minute = 0
var hour = 0
var day = 0
var month = 0
var year = 0

signal ticked()
signal hour_changed()
signal day_changed()
signal month_changed()
signal year_changed()

func tick():
	emit_signal("ticked")
	minute += 1
	if minute == MINUTES_IN_HOUR:
		minute = 0;
		hour += 1
		hour_changed()

func hour_changed():
	emit_signal("hour_changed")
	hour += 1
	if hour == HOUR_IN_DAY:
		hour = 0
		day += 1
		day_changed()

func day_changed():
	emit_signal("day_changed")
	day += 1
	if day == DAY_IN_MONTH:
		day = 0
		month += 1
		month_changed()

func month_changed():
	emit_signal("month_changed")
	month += 1
	if month == MONTH_IN_YEAR:
		month = 0
		year += 1
		year_changed()

func year_changed():
	emit_signal("year_changed")
	year += 1
	
	





