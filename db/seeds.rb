# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

p "Seeding Countries"
Country.create([{name: 'Country1', currency: 'Rupee', timezone: 'IST'},
				{name: 'Country2', currency: 'Pound', timezone: 'PST'}])
countries = Country.all

p "Seeding states"
State.create([{name: 'State1', literacy:80.0, country: countries[0] }, 
              {name: 'State2', literacy:90.0, country: countries[0] },
              {name: 'State3', literacy:98.0, country: countries[0] },
              {name: 'State4', literacy:57.0, country: countries[0] },
              {name: 'State5', literacy:77.0, country: countries[1] }, 
              {name: 'State6', literacy:89.0, country: countries[1] },
              {name: 'State7', literacy:56.0, country: countries[1] },
              {name: 'State8', literacy:83.0, country: countries[1] }
              ])
states = State.all

p "Seeding cities"
City.create([{name: 'City1', area: 4200, population: 100, state: states[0]},
             {name: 'City2', area: 1200, population: 200, state: states[0]},
             {name: 'City3', area: 2200, population: 700, state: states[0]},
             {name: 'City4', area: 2600, population: 800, state: states[0]},
             {name: 'City5', area: 600, population: 900, state: states[0]},
             {name: 'City6', area: 200, population: 100, state: states[1]},
             {name: 'City7', area: 1200, population: 100, state: states[1]},
             {name: 'City8', area: 2700, population: 700, state: states[1]},
             {name: 'City9', area: 600, population: 300, state: states[1]},
             {name: 'City10', area: 900, population: 980, state: states[1]},
             {name: 'City11', area: 200, population: 100, state: states[2]},
             {name: 'City12', area: 1200, population: 190, state: states[2]},
             {name: 'City13', area: 2700, population: 700, state: states[2]},
             {name: 'City14', area: 600, population: 800, state: states[2]},
             {name: 'City15', area: 900, population: 980, state: states[2]},
             {name: 'City16', area: 200, population: 100, state: states[3]},
             {name: 'City17', area: 1200, population: 190, state: states[3]},
             {name: 'City18', area: 2700, population: 700, state: states[3]},
             {name: 'City19', area: 600, population: 800, state: states[3]},
             {name: 'City20', area: 900, population: 980, state: states[3]},
             {name: 'City21', area: 2200, population: 700, state: states[4]},
             {name: 'City22', area: 2600, population: 800, state: states[4]},
             {name: 'City23', area: 600, population: 900, state: states[4]},
             {name: 'City24', area: 200, population: 100, state: states[4]},
             {name: 'City25', area: 1200, population: 100, state: states[4]},
             {name: 'City26', area: 2700, population: 700, state: states[4]},
             {name: 'City27', area: 1200, population: 190, state: states[5]},
             {name: 'City28', area: 2700, population: 700, state: states[5]},
             {name: 'City29', area: 600, population: 800, state: states[5]},
             {name: 'City30', area: 900, population: 980, state: states[5]},
             {name: 'City31', area: 2200, population: 700, state: states[5]},
             {name: 'City32', area: 1200, population: 190, state: states[6]},
             {name: 'City33', area: 2700, population: 700, state: states[6]},
             {name: 'City34', area: 600, population: 800, state: states[7]},
             {name: 'City35', area: 900, population: 980, state: states[7]}
            ])
