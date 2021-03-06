# CodeBook
- There is a total of 68 columns in this data set. Each row contains data related to 1 activity for a certain person.

- There are data for 30 persons, each one was tracked for 6 activities, so there are a total of 180 rows of data.

- Each row contains data for 66 variables, each one being the average of the raw data for the corresponding person/activity combination.

 


### Data
* [Subject_id] - There are total 30 subject, each subject is alloted a number to identify.
* [Activity] - Each Activity is assigned a name and an Activity id.

### Variables

You can identify their meaning by examining how each variable is named:

- Variables starting with "FrequencyDomain" contains data after the Fast Fourier Transform.
- Variables starting with "TimeDomain" contains raw data, before the Fast Fourier Transform.
- Variables ending with "Mean" or "MeanX/Y/Z" contains the mean value of the data or for its axis.
- Variables ending with "Std" or "StdX/Y/Z" contains the standard deviation of the data or for its axis.
- The middle of the variable name contains what exactly is the data and its procedence, if it was taken from the accelerometer or from the gyroscope.

#### Signals
- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

#### Set of Operations on signals
- mean(): Mean value
- std(): Standard deviation
