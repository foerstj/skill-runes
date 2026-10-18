:: path of Bits dir
set bits=%~dp0.

pushd "%GasPy%"

setlocal enableDelayedExpansion
for %%w in (regular veteran elite) do (
  venv\Scripts\python -m jinja "world\contentdb\templates.jinja\%%w\skill-rune-{{level}}-{{skills}}.gas.jinja" "world\contentdb\templates\skill-runes\%%w\interactive\gen-runes" --for-each "world\contentdb\templates.jinja\%%w\skill-runes.csv" --bits "%bits%"
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m jinja "world\contentdb\templates.jinja\%%w\skill-rune-startpos-{{slug}}-{{skills}}.gas.jinja" "world\contentdb\templates\skill-runes\%%w\interactive\gen-runes" --for-each "world\contentdb\templates.jinja\%%w\skill-runes-startpos.csv" --bits "%bits%"
  if !errorlevel! neq 0 pause

  venv\Scripts\python -m jinja "world\contentdb\templates.jinja\%%w\skill-runes-container-{{level}}.gas.jinja" "world\contentdb\templates\skill-runes\%%w\interactive\containers\gen-containers" --bits "%bits%"
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m jinja "world\contentdb\templates.jinja\%%w\skill-runes-container-startpos-{{slug}}.gas.jinja" "world\contentdb\templates\skill-runes\%%w\interactive\containers\gen-containers" --bits "%bits%"
  if !errorlevel! neq 0 pause

  venv\Scripts\python -m jinja "world\contentdb\templates.jinja\%%w\skill-runes-container-by-skill.gas.jinja" "world\contentdb\templates\skill-runes\%%w\interactive\containers" --for-all "world\contentdb\templates.jinja\%%w\skill-runes.csv" --bits "%bits%"
  if !errorlevel! neq 0 pause
  venv\Scripts\python -m jinja "world\contentdb\templates.jinja\%%w\skill-runes-container-by-skill-startpos.gas.jinja" "world\contentdb\templates\skill-runes\%%w\interactive\containers" --for-all "world\contentdb\templates.jinja\%%w\skill-runes-startpos.csv" --bits "%bits%"
  if !errorlevel! neq 0 pause
)
endlocal

popd
