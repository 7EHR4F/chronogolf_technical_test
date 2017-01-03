# README
#Technical test for chronogolf

To start the app:

* just run : sh start_app.sh

* Both parsing methods are run when using the frontend, causing the main loop to hang for a bit, to see individual results just run the tests with the following : rails test.

* During test execution the ruby benchmark module will output the run time for both methods.

* Both methods are saving the result in a json-friendly format, however, the first method aims to split the data into different Arrays before consuming it, as the second aims to split it at runtime, allowing a better general efficiency by not splitting the data into right/left Arrays (this allows to avoid moving each Right element into another Array). 

* The next step would be to use delayed_jobs and update the user front with ActionCable once the job is done, as I did for another technical test on my github.

