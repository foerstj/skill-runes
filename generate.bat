:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\regular\skill-rune-{{level}}-{{skills}}.gas.jinja" world\contentdb\templates\skill-runes\regular\interactive\gen-runes --for-each "world\contentdb\templates.jinja\regular\skill-runes.csv" --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\regular\skill-runes-container-{{level}}.gas.jinja" world\contentdb\templates\skill-runes\regular\interactive\containers\gen-containers --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\regular\skill-runes-container-by-skill.gas.jinja" world\contentdb\templates\skill-runes\regular\interactive\containers --for-all "world\contentdb\templates.jinja\regular\skill-runes.csv" --bits "%bits%"
if %errorlevel% neq 0 pause

venv\Scripts\python -m jinja "world\contentdb\templates.jinja\veteran\skill-rune-{{level}}-{{skills}}.gas.jinja" world\contentdb\templates\skill-runes\veteran\interactive\gen-runes --for-each "world\contentdb\templates.jinja\veteran\skill-runes.csv" --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\veteran\skill-runes-container-{{regular_lvl}}.gas.jinja" world\contentdb\templates\skill-runes\veteran\interactive\containers --bits "%bits%"
if %errorlevel% neq 0 pause

venv\Scripts\python -m jinja "world\contentdb\templates.jinja\elite\skill-rune-{{level}}-{{skills}}.gas.jinja" world\contentdb\templates\skill-runes\elite\interactive\gen-runes --for-each "world\contentdb\templates.jinja\elite\skill-runes.csv" --bits "%bits%"
if %errorlevel% neq 0 pause
venv\Scripts\python -m jinja "world\contentdb\templates.jinja\elite\skill-runes-container-{{regular_lvl}}.gas.jinja" world\contentdb\templates\skill-runes\elite\interactive\containers --bits "%bits%"
if %errorlevel% neq 0 pause
popd
