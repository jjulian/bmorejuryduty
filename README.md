# bmorejuryduty
The [@bmorejuryduty](https://twitter.com/bmorejuryduty) twitter robot has been collecting jury duty information since 2009, rebroadcasting the jury selection counts on twitter.

This project aims to centralize the data collection and provide excellent tools on top of the data.

## Data collector
Scrape information daily from the [Baltimore City Circuit Court site](http://www.baltocts.sailorsite.net/flypage/juror-select.html), save the date and juror count into the db. Will run as a clock job on Heroku.

**Data Importer:** In addition, all data from 2009 onward needs to be imported into the db. Twitter provides a history of tweets, from which we can parse the dates and counts. Data dump is in `db/twitter`.

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
