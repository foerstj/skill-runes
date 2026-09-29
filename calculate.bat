:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"
venv\Scripts\python -m skill_progression --output-csv "%bits%" --class-lookup "%bits%" --levels 5:50:5 60:100:20 120:150:30 --skills melee ranged nmagic cmagic
if %errorlevel% neq 0 pause
venv\Scripts\python -m skill_progression --output-csv "%bits%" --class-lookup "%bits%" --levels 0:50:10 100:150:50 --skills melee ranged nmagic cmagic --world-level veteran
if %errorlevel% neq 0 pause
venv\Scripts\python -m skill_progression --output-csv "%bits%" --class-lookup "%bits%" --levels 0:50:10 100:150:50 --skills melee ranged nmagic cmagic --world-level elite
if %errorlevel% neq 0 pause
popd

move /Y "%bits%\skill-progression.csv" "%bits%\world\contentdb\templates.jinja\regular\skill-runes.csv"
move /Y "%bits%\skill-progression-veteran.csv" "%bits%\world\contentdb\templates.jinja\veteran\skill-runes.csv"
move /Y "%bits%\skill-progression-elite.csv" "%bits%\world\contentdb\templates.jinja\elite\skill-runes.csv"
