# bmorejuryduty
The [@bmorejuryduty](https://twitter.com/bmorejuryduty) twitter robot has been collecting jury duty information since 2009, rebroadcasting the jury selection counts on twitter.

This project aims to centralize the data collection and provide excellent tools on top of the data.

## Data collector
Scrape information daily from the [Baltimore City Circuit Court site](http://www.baltocts.sailorsite.net/flypage/juror-select.html), save the date and juror count into the db. Will run as a clock job on Heroku.

**Data Importer:** In addition, all data from 2009 onward needs to be imported into the db. Twitter provides a history of tweets, from which we can parse the dates and counts. Data dump is in `db/twitter`.

### Clean CSV

The data was cleaned using [Google Refine](http://openrefine.org/).  The clean csv contains the following columns:

1. **text** `string` Original tweet text
2. **closed** `bool `If court was closed that day
3. **all** `bool` If all jurors were required
4. **min** `int` The min juror number to report
5. **max** `int` The max juror number to report
6. **date** `date` The reporting date
7. **tweet_id** `int` ID from Twitter
8. **timestamp** `date` Timestamp from Twitter

Some notes on the data:

* **closed/all** take precedence over min/max numbers, you can ignore the min max if **closed** or **all** are `true`
* There was one case of a tweet specifying multiple days for Dec 30 and 31, 2009
* There are duplicate rows, where the same text was tweeted multiple times

## Twitter account: [@bmorejuryduty](https://twitter.com/bmorejuryduty)
Tweet the jury duty requested count every evening after collecting the data. Runs immediately after data is inserted into the db. Code for this is in another repo.

## Data Visualization
Show interesting statistics about jury duty counts: most recent counts, avg by week/month/year, avg by day of week, etc.

## Jury Duty Predictor
Enter your jury duty date and juror number, get back a prediction if you will be called to go to jury duty.

## API
Simple JSON API to return jury duty data for a given date range.

#### Development

    bundle
    rake text
    bundle exec rails s unicorn
