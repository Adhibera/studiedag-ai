#!/usr/bin/env bash
# Statusline voor de studiedag-workshop — tekent een "bureau"-meter die laat zien
# hoe vol het contextvenster zit. Sluit aan op het praatje: bureau = context,
# tokens = hoe vol het ligt.
#
# Leest de sessie-JSON van Claude Code op stdin en print één regel.
# Vereist: bash + jq. Gebruikt de native context_window.*-velden (Claude Code >= 2.1.132).
#
# Twee routes in de workshop:
#   1. live moment — laat Claude dit zelf schrijven via /statusline (een echt daadje);
#   2. fallback — facilitator wijst settings.json naar dit bestand:
#        "statusLine": { "type": "command", "command": "./.claude/statusline.sh" }

input=$(cat)

model=$(printf '%s' "$input" | jq -r '.model.display_name // "Claude"')
pct=$(printf '%s' "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)
used=$(printf '%s' "$input" | jq -r '.context_window.total_input_tokens // 0')
size=$(printf '%s' "$input" | jq -r '.context_window.context_window_size // 200000')
over=$(printf '%s' "$input" | jq -r '.exceeds_200k_tokens // false')

# Balk van 10 blokken; elk blok = 10% van het bureau. Afronden (niet afkappen),
# zodat de balk al beweegt bij de eerste sprong — anders blijft 'm leeg tot 10%.
filled=$(( (pct + 5) / 10 ))
(( filled > 10 )) && filled=10
(( filled < 0 )) && filled=0
empty=$(( 10 - filled ))

bar=""
for ((i = 0; i < filled; i++)); do bar+="▓"; done
for ((i = 0; i < empty;  i++)); do bar+="░"; done

# Tokens compact tonen: 16k, 200k, 1M.
human() {
  local n=$1
  if (( n >= 1000000 )); then
    local m=$(( n / 1000000 )) r=$(( (n % 1000000) / 100000 ))
    if (( r == 0 )); then printf '%dM' "$m"; else printf '%d.%dM' "$m" "$r"; fi
  elif (( n >= 1000 )); then
    printf '%dk' $(( (n + 500) / 1000 ))
  else
    printf '%d' "$n"
  fi
}

line="${model} · bureau ${bar} ${pct}% · $(human "$used")/$(human "$size") tokens"
[ "$over" = "true" ] && line+=" ⚠ >200k"

printf '%s' "$line"
