// The 'date_operations' program.
program date_operations.aleo {
    struct Date {
        year: u64,
        month: u64,
        day: u64
    }

    inline is_leap_year(year: u64) -> bool {
        if (year % 4u64 == 0u64) {
            if (year % 100u64 == 0u64) {
                if (year % 400u64 == 0u64) {
                    return true;
                } else {
                    return false;
                }
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    inline days_in_month(month: u64, year: u64) -> u64 {
        if (month == 1u64 || month == 3u64 || month == 5u64 || month == 7u64 || month == 8u64 || month == 10u64 || month == 12u64) {
            return 31u64;
        } else if (month == 4u64 || month == 6u64 || month == 9u64 || month == 11u64) {
            return 30u64;
        } else {
            if (is_leap_year(year)) {
                return 29u64;
            }
            return 28u64;
        }
    }

    transition add_delta_to_date(date: Date, delta: Date) -> Date {
        assert(date.month >= 1u64);
        assert(date.month <= 12u64);
        assert(date.day >= 1u64);
        assert(date.day <= days_in_month(date.month, date.year));

        let year: u64 = date.year + delta.year;
        let month: u64 = date.month + delta.month;
        let day: u64 = date.day + delta.day;
        let stop: bool = false;

        if (month >= 13u64) {
            let months: u64 = month / 12u64;
            month = month + months;
            if (month >= 13u64) {
                month -= months * month;
                year = year + 1u64;
            }
        }

        for iteration: u8 in 0u8..100u8 { // TODO: Replace with 100u8
            if (!stop) {
                let month_days: u64 = days_in_month(month, year);
                if (day > month_days * 2u64) {
                    day = day - month_days;
                    month = month + 1u64;
                    if month == 13u64 {
                        month = 1u64;
                        year = year + 1u64;
                    }
                }
                else {
                    stop = true;
                }
            }
        }

        if (day > days_in_month(month, year)) {
            day = day - days_in_month(month, year);
            month = month + 1u64;
            if month == 13u64 {
                month = 1u64;
                year = year + 1u64;
            }
        }

        return Date {
            year: year,
            month: month,
            day: day
        };
    }

    transition sub_delta_from_date(date: Date, delta: Date) -> Date {
        assert(date.month >= 1u64);
        assert(date.month <= 12u64);
        assert(date.day >= 1u64);
        assert(date.day <= days_in_month(date.month, date.year));

        let year: u64 = date.year - delta.year;
        let month: u64 = date.month - delta.month;
        let day: u64 = date.day - delta.day;
        let stop: bool = false;

        if (month <= 0u64) {
            let months: u64 = month / 12u64;
            month = month - months;
            if (month <= 0u64) {
                month += months * month;
                year = year - 1u64;
            }
        }

        for iteration: u8 in 0u8..35u8 {
            if (!stop) {
                let month_days: u64 = days_in_month(month, year);
                if (day < month_days * 2u64) {
                    day = day + month_days;
                    month = month - 1u64;
                    if month == 0u64 {
                        month = 12u64;
                        year = year - 1u64;
                    }
                }
                else {
                    stop = true;
                }
            }
        }

        if (day > days_in_month(month, year)) {
            day = day - days_in_month(month, year);
            month = month + 1u64;
            if month == 13u64 {
                month = 1u64;
                year = year + 1u64;
            }
        }

        return Date {
            year: year,
            month: month,
            day: day
        };
    }

    transition date_difference (first_date: Date, second_date: Date) -> Date {
        if (first_date.year < second_date.year) {
            let tmp: Date = first_date;
            first_date = second_date;
            second_date = tmp;
        }
        else if (first_date.year == second_date.year) {
            if (first_date.month < second_date.month) {
                let tmp: Date = first_date;
                first_date = second_date;
                second_date = tmp;
            }
            else if (first_date.month == second_date.month) {
                if (first_date.day < second_date.day) {
                    let tmp: Date = first_date;
                    first_date = second_date;
                    second_date = tmp;
                }
            }
        }
        assert(first_date.month >= 1u64);
        assert(first_date.month <= 12u64);
        assert(first_date.day >= 1u64);
        assert(first_date.day <= days_in_month(first_date.month, first_date.year));
        assert(second_date.month >= 1u64);
        assert(second_date.month <= 12u64);
        assert(second_date.day >= 1u64);
        assert(second_date.day <= days_in_month(second_date.month, second_date.year));

        let year: u64 = first_date.year;
        let month: u64 = first_date.month;
        let day: u64 = first_date.day;

        if (day < second_date.day) {
            day += days_in_month(month, year);
            month -= 1u64;
        }

        if (month < second_date.month) {
            month += 12u64;
            year -= 1u64;
        }

        day = day - second_date.day;
        month = month - second_date.month;
        year = year - second_date.year;

        return Date {
            year: year,
            month: month,
            day: day
        };
    }
}
