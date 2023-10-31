# 📆 Date Operations in Leo

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

```leo
leo run add_delta_to_date <date> <delta>
```
- Adds the `delta` (years, months, days) to the `date`.
- Returns a new `Date` struct with the modified date.

#### Subtract Delta from Date
```leo
leo run sub_delta_from_date <date> <delta>
```
- Subtracts the `delta` (years, months, days) from the `date`.
- Returns a new `Date` struct with the modified date.

#### Date Difference
```leo
leo run date_difference <first_date> <second_date>
```

- Calculates the difference between first_date and second_date.
- Returns a new Date struct representing the difference in years, months, and days

## 📚 Documentation
For more detailed information on the Leo programming language and its syntax, you can visit the official documentation [here](https://developer.aleo.org/leo/).

Made with 💙 by Borys Moskovenko
