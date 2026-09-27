:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"
venv\Scripts\python -m skill_progression --output-csv "%bits%" --class-lookup "%bits%" --levels 5:50:5 60:80:20 100:150:50 --skills melee ranged nmagic cmagic
if %errorlevel% neq 0 pause
popd

move /Y "%bits%\skill-progression.csv" "%bits%\world\contentdb\templates.jinja\regular\interactive\skill-runes.csv"
pause
