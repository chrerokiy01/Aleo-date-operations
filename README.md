# 📆 Date Operations in Leo
My discrod: chrerokiy01
Welcome to the `date_operations` program, a magnificent creation written in the Leo programming language by the Aleo project! 🚀 This program is your go-to solution for manipulating and calculating dates in various ways, ensuring accuracy and ease of use. 

## 🌟 Features

- **Add Delta to Date**: Add years, months, and days to a specific date.
- **Subtract Delta from Date**: Subtract years, months, and days from a specific date.
- **Date Difference**: Calculate the difference between two dates in years, months, and days.

## 🚀 Usage

### 📌 Structs and Functions

- **Date Struct**
  - `year: u64`
  - `month: u64`
  - `day: u64`

### 🚀 Transitions

#### Add Delta to Date

```bash
leo run add_delta_to_date <date> <delta>
```
- Adds the `delta` (years, months, days) to the `date`.
- Returns a new `Date` struct with the modified date.

#### Subtract Delta from Date
```bash
leo run sub_delta_from_date <date> <delta>
```
- Subtracts the `delta` (years, months, days) from the `date`.
- Returns a new `Date` struct with the modified date.

#### Date Difference
```bash
leo run date_difference <first_date> <second_date>
```

- Calculates the difference between first_date and second_date.
- Returns a new Date struct representing the difference in years, months, and days

#### Day of week
```bash
leo run day_of_week <date>
```

- Calculates the day of the week for a date
- Returns the number of the day of the week, where 0u8 is Monday and 6u8 is Sunday

## 📚 Documentation
For more detailed information on the Leo programming language and its syntax, you can visit the official documentation [here](https://developer.aleo.org/leo/).

Made with 💙 by Borys Moskovenko
