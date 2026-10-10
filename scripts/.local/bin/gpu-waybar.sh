#!/bin/bash
# GPU amdgpu -> JSON para waybar. Caminho PCI fixo (hwmonN muda entre boots).
D=/sys/devices/pci0000:00/0000:00:03.1/0000:0a:00.0/0000:0b:00.0/0000:0c:00.0

[ -r "$D/gpu_busy_percent" ] || { echo '{"text":"--","tooltip":"amdgpu nao encontrado"}'; exit 0; }

r() { cat $1 2>/dev/null || echo 0; }

busy=$(< "$D/gpu_busy_percent")
used=$((  $(< "$D/mem_info_vram_used")  / 1048576 ))
total=$(( $(< "$D/mem_info_vram_total") / 1048576 ))

H="$D/hwmon"/hwmon*
junc=$((  $(r $H/temp2_input) / 1000 ))
edge=$((  $(r $H/temp1_input) / 1000 ))
vmem=$((  $(r $H/temp3_input) / 1000 ))
watt=$((  $(r $H/power1_average) / 1000000 ))
fan=$(r $H/fan1_input)
sclk=$(( $(r $H/freq1_input) / 1000000 ))
mclk=$(( $(r $H/freq2_input) / 1000000 ))

cls=""
[ "$busy" -ge 80 ] && cls="warning"
[ "$busy" -ge 95 ] && cls="critical"

printf '{"text":"%s","class":"%s","tooltip":"VRAM %s / %s MiB\\nJunction %s°C · Edge %s°C · Mem %s°C\\nCore %s MHz · Mem %s MHz\\n%s W · %s RPM"}\n' \
  "$busy" "$cls" "$used" "$total" "$junc" "$edge" "$vmem" "$sclk" "$mclk" "$watt" "$fan"
