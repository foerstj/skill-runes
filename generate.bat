:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\regular\interactive\skill-runes-{{lvl}}.gas.jinja" world\contentdb\templates\regular\interactive --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\regular\interactive\skill-runes-container-{{lvl}}.gas.jinja" world\contentdb\templates\regular\interactive --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\regular\interactive\skill-runes-container-by-skill.gas.jinja" --for-all "world\contentdb\templates.jinja\regular\interactive\skill-runes-{{lvl}}.gas.csv" world\contentdb\templates\regular\interactive --bits "%bits%"
if %errorlevel% neq 0 pause

venv\Scripts\python -m jinja "world\contentdb\templates.jinja\veteran\interactive\skill-runes-{{regular_lvl}}.gas.jinja" world\contentdb\templates\veteran\interactive --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\veteran\interactive\skill-runes-container-{{regular_lvl}}.gas.jinja" world\contentdb\templates\veteran\interactive --bits "%bits%"
if %errorlevel% neq 0 pause

venv\Scripts\python -m jinja "world\contentdb\templates.jinja\elite\interactive\skill-runes-{{regular_lvl}}.gas.jinja" world\contentdb\templates\elite\interactive --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\elite\interactive\skill-runes-container-{{regular_lvl}}.gas.jinja" world\contentdb\templates\elite\interactive --bits "%bits%"
if %errorlevel% neq 0 pause
popd
