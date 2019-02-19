# Code Book

Code book to indicate all the variables and summaries calculated, along with units, and any other relevant information.
The basic information about this data set could be found in `README.MD`

## There are two main files:
* `tidy_data.txt` contains describing in codebook data set, data set separated by spaces and contains variables names in first row and variables values in other roews;
* `run_analysis.R` contains script performing the data set, script includes comments during the code;

## [run_analysis.R](/run_analysys.R) Process
Original (not transformated) data set could be found via link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Transformations was made with the data set from upper link:
1. Loading required libraries (`dplyr` and `stringr`).
2. Checking dataset source files exist, downloading and unpacking them if false.
3. Reading required source files to data frames.
4. Merging several data frames in to one data set and one data frame.
5. Extracting measurements were required in project task.
6. Making variables names more descriptive.
7. Appropriating labels.
8. Means dataset.
9. Write dataset into file.

## Variables
Data set contains 82 variables for each subject:
* **3 variables for descript the subject**:
  * `subject_id` - integer, identifiers for objects of observation;
      Possible values for `subject_id` are integer values from 1 to 30.
  * `activity_id` - integer, identifiers for activities
  * `activity_name` - factor, descriptive names of activities
       Possible values of `activity_id` and `activity_name`:
       * ID:1 NAME:WALKING
       * ID:2 NAME:WALKING_UPSTAIRS
       * ID:3 NAME:WALKING_DOWNSTAIRS
       * ID:4 NAME:SITTING
       * ID:5 NAME:STANDING
       * ID:6 NAME:LAYING
 
* **79 variables of measurements**:

  ### Averaging
  
  Each variable is normalized float number beetween -1 and 1.
  Models of measurement calculation included in variables names.
  
  There are calculation models:
    - Variable name includes `Accelerometer` - acceleration measurements made in g's (9.81 m.s⁻²);
    - Variable name includes `Gyroscope` - gyroscope measurements made in radians per second (rad.s⁻¹);
    - Variable name includes `Magnitude`- magnitudes of three-dimensional signals calculated by Euclidean norm.
  
  Also calculations split in two domains:
    - Variable name includes `time` - capture of accelerometer and gyroscope raw signals;
    - Variable name includes `frequency` - application of a Fast Fourier Transform (FFT) to some of the time-domain signals.
    
  ### Detailing the time domain signals
  
  Average time-domain body acceleration in given axes:
    > `timeDomainBodyAccelerometerMeanX`
    > `timeDomainBodyAccelerometerMeanY`
    > `timeDomainBodyAccelerometerMeanZ`
    
  Standard deviation of the time-domain body acceleration in given axes:
    > `timeDomainBodyAccelerometerStandardDeviationX`
    > `timeDomainBodyAccelerometerStandardDeviationY`
    > `timeDomainBodyAccelerometerStandardDeviationZ`

  Average time-domain gravity acceleration in given axes:
    > `timeDomainGravityAccelerometerMeanX`
    > `timeDomainGravityAccelerometerMeanY`
    > `timeDomainGravityAccelerometerMeanZ`

  Standard deviation of the time-domain gravity acceleration in given axes:
    > `timeDomainGravityAccelerometerStandardDeviationX`
    > `timeDomainGravityAccelerometerStandardDeviationY`
    > `timeDomainGravityAccelerometerStandardDeviationZ`

  Average time-domain body acceleration jerk (derivation of the acceleration in time) in given axes:
    > `timeDomainBodyAccelerometerJerkMeanX`
    > `timeDomainBodyAccelerometerJerkMeanY`
    > `timeDomainBodyAccelerometerJerkMeanZ`

  Standard deviation of the time-domain body acceleration jerk (derivation of the acceleration in time) in given axes:
    > `timeDomainBodyAccelerometerJerkStandardDeviationX`
    > `timeDomainBodyAccelerometerJerkStandardDeviationY`
    > `timeDomainBodyAccelerometerJerkStandardDeviationZ`

  Average time-domain body angular velocity in given axes:
    > `timeDomainBodyGyroscopeMeanX`
    > `timeDomainBodyGyroscopeMeanY`
    > `timeDomainBodyGyroscopeMeanZ`

  Standard deviation of the time-domain body angular velocity in given axes:
    > `timeDomainBodyGyroscopeStandardDeviationX`
    > `timeDomainBodyGyroscopeStandardDeviationY`
    > `timeDomainBodyGyroscopeStandardDeviationZ`

  Average time-domain body angular velocity jerk (derivation of the angular velocity in time) in given axes:
    > `timeDomainBodyGyroscopeJerkMeanX`
    > `timeDomainBodyGyroscopeJerkMeanY`
    > `timeDomainBodyGyroscopeJerkMeanZ`

  Standard deviation of the time-domain body angular velocity jerk (derivation of the angular velocity in time) in given axes:
    > `timeDomainBodyGyroscopeJerkStandardDeviationX`
    > `timeDomainBodyGyroscopeJerkStandardDeviationY`
    > `timeDomainBodyGyroscopeJerkStandardDeviationZ`

  Average and standard deviation of the time-domain magnitude of body acceleration:
    > `timeDomainBodyAccelerometerMagnitudeMean`
    > `timeDomainBodyAccelerometerMagnitudeStandardDeviation`

  Average and standard deviation of the time-domain magnitude of gravity acceleration:
    > `timeDomainGravityAccelerometerMagnitudeMean`
    > `timeDomainGravityAccelerometerMagnitudeStandardDeviation`
    
  Average and standard deviation of the time-domain magnitude of body acceleration jerk (derivation of the acceleration in time):
    > `timeDomainBodyAccelerometerJerkMagnitudeMean`
    > `timeDomainBodyAccelerometerJerkMagnitudeStandardDeviation`

  Average and standard deviation of the time-domain magnitude of body angular velocity:
    > `timeDomainBodyGyroscopeMagnitudeMean`
    > `timeDomainBodyGyroscopeMagnitudeStandardDeviation`

  Average and standard deviation of the time-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):
    > `timeDomainBodyGyroscopeJerkMagnitudeMean`
    > `timeDomainBodyGyroscopeJerkMagnitudeStandardDeviation`

  ### Detailing the frequency domain signals

  Average frequency-domain body acceleration in given axes:
    > `frequencyDomainBodyAccelerometerMeanX``
    > `frequencyDomainBodyAccelerometerMeanY`
    > `frequencyDomainBodyAccelerometerMeanZ`

  Standard deviation of the frequency-domain body acceleration in given axes:
    > `frequencyDomainBodyAccelerometerStandardDeviationX`
    > `frequencyDomainBodyAccelerometerStandardDeviationY`
    > `frequencyDomainBodyAccelerometerStandardDeviationZ`

  Weighted average of the frequency components of the frequency-domain body acceleration in given axes:
    > `frequencyDomainBodyAccelerometerMeanFrequencyX`
    > `frequencyDomainBodyAccelerometerMeanFrequencyY`
    > `frequencyDomainBodyAccelerometerMeanFrequencyZ`

  Average frequency-domain body acceleration jerk (derivation of the acceleration in time) in given axes:
    > `frequencyDomainBodyAccelerometerJerkMeanX`
    > `frequencyDomainBodyAccelerometerJerkMeanY`
    > `frequencyDomainBodyAccelerometerJerkMeanZ`

  Standard deviation of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in given axes:
    > `frequencyDomainBodyAccelerometerJerkStandardDeviationX`
    > `frequencyDomainBodyAccelerometerJerkStandardDeviationY`
    > `frequencyDomainBodyAccelerometerJerkStandardDeviationZ`

  Weighted average of the frequency components of the frequency-domain body acceleration jerk (derivation of the acceleration in time) in given axes:
    > `frequencyDomainBodyAccelerometerJerkMeanFrequencyX`
    > `frequencyDomainBodyAccelerometerJerkMeanFrequencyY`
    > `frequencyDomainBodyAccelerometerJerkMeanFrequencyZ`

  Average frequency-domain body angular velocity in given axes:
    > `frequencyDomainBodyGyroscopeMeanX`
    > `frequencyDomainBodyGyroscopeMeanY`
    > `frequencyDomainBodyGyroscopeMeanZ`

  Standard deviation of the frequency-domain body angular velocity in given axes:
    > `frequencyDomainBodyGyroscopeStandardDeviationX`
    > `frequencyDomainBodyGyroscopeStandardDeviationY`
    > `frequencyDomainBodyGyroscopeStandardDeviationZ`

  Weighted average of the frequency components of the frequency-domain body angular velocity in given axes:
    > `frequencyDomainBodyGyroscopeMeanFrequencyX`
    > `frequencyDomainBodyGyroscopeMeanFrequencyY`
    > `frequencyDomainBodyGyroscopeMeanFrequencyZ`

  Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration:
    > `frequencyDomainBodyAccelerometerMagnitudeMean`
    > `frequencyDomainBodyAccelerometerMagnitudeStandardDeviation`
    > `frequencyDomainBodyAccelerometerMagnitudeMeanFrequency`

  Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body acceleration jerk (derivation of the acceleration in time):
    > `frequencyDomainBodyAccelerometerJerkMagnitudeMean`
    > `frequencyDomainBodyAccelerometerJerkMagnitudeStandardDeviation`
    > `frequencyDomainBodyAccelerometerJerkMagnitudeMeanFrequency`

  Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity:
    > `frequencyDomainBodyGyroscopeMagnitudeMean`
    > `frequencyDomainBodyGyroscopeMagnitudeStandardDeviation`
    > `frequencyDomainBodyGyroscopeMagnitudeMeanFrequency`

  Average, standard deviation, and weighted average of the frequency components of the frequency-domain magnitude of body angular velocity jerk (derivation of the angular velocity in time):
    > `frequencyDomainBodyGyroscopeJerkMagnitudeMean`
    > `frequencyDomainBodyGyroscopeJerkMagnitudeStandardDeviation`
    > `frequencyDomainBodyGyroscopeJerkMagnitudeMeanFrequency`
