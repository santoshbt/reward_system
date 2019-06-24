Reward System
--------------

Softwares installed 
Ruby - ruby 2.5.0p0 (2017-12-25 revision 61468) [x86_64-darwin18] 
Rails - Rails 5.2.3 
postgres - (PostgreSQL) 9.6.11 
Gems: rspec, pg 

run rake db:create 
    rake db:migrate

check using console
-------------------
  data = "2018-06-12 09:41 A recommends B <br />
  2018-06-14 09:41 B accepts <br />
  2018-06-16 09:41 B recommends C <br />
  2018-06-17 09:41 C accepts <br />
  2018-06-19 09:41 C recommends D <br />
  2018-06-23 09:41 B recommends D <br />
  2018-06-25 09:41 D accepts" 

  Reward.customer_rewards(data) <br />
  {"A"=>1.75, "B"=>1.5, "C"=>1.0}

check in postman
---------------
GET localhost:3000/customer_rewards

Run tests
---------
rspec

Rules followed
--------------

I have broken down the problem into smaller tasks.
Reward is the activerecord model which does the ActiveRecord validations, and calls the methods under services.
Services contains plain ruby classes which contains the supporting logic for the business logic of "Reward".
They are decoupled from adding up any dependency and can be plugged in on any other places. 
Services logic is limited to their boundaries.
I have tried to implement the compositin over the inheritance to avoid the duplicate code and hassles if the features are added up in future.

Logic Implemenation
-------------------

The database has only required fields and avoids populating unnecessary data, to keep the table size in limits.
Whenever a "recommendation" row is encountered, I am fetching the invitor and invitee and storing in table.
This should happen only if no duplicate combination of invitor and invitee exists before.
Whenever an "acceptor" row is encountered, fetch the acceptor and check the oldest(first) record which contains this acceptor as invitee.

Calulating the points -
Update that record by 1 - for direct invitor
Repeat this process to find this invitor as invitee of other record and add the points by 0.5. - First level invitor
Repeat again to find if there is a second level invitor and add the points by 0.25
Return the results in the required format.

Controller method reads a file in the public folder and gets back the required result and outputs in JSON format.
Tested the logic with the given data. Also tested the logic in services.
Used the reward factory to test the calculation of points.

Thanks,
Santosh Turamari
