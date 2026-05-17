#!/bin/bash
# All paintings needed
PAINTINGS=(
  "02_molasses_disaster|The Boston Molasses Disaster, 1919"
  "06_pig_trial|A cow on trial in a medieval courtroom, 1327"
  "07_castle_itter|Medieval castle battle with American and German soldiers, 1945"
  "08_dark_day|New England town in total darkness at midday, 1780"
  "09_pig_war|Soldiers chasing emus on a battlefield, 1859"
  "10_christmas_truce|WWI soldiers playing football in no man's land Christmas, 1914"
  "11_carrington_event|Dramatic aurora borealis over telegraph lines, 1859"
  "12_bicycle_face|Victorian woman with exaggerated worried expression riding bicycle, 1896"
  "13_war_worlds_panic|Panicked crowds fleeing from alien tripods, 1938"
  "14_whale_swallow|Giant whale swallowing a sailor on a whaling ship, 1599"
  "15_krakatoa|Massive volcanic eruption at sea with lightning, 1883"
  "16_swamp_fire|Enormous wildfire in a dark swamp at night, 1928"
  "17_emu_war|Australian soldiers with machine guns facing emus, 1933"
  "18_cheese_riot|Angry mob fighting over giant cheese wheels in London, 1770"
  "19_rain_of_fish|Fish falling from the sky over an Indian village, 1666"
  "20_laki_eruption|Icelandic volcanic eruption with poisonous yellow haze, 1783"
  "21_wall_street_bombing|Explosion on Wall Street with crowds running, 1920"
  "22_schoolchildren_blizzard|Children lost in a brutal blizzard, 1888"
  "24_galveston_hurricane|Massive hurricane destroying a coastal city, 1900"
  "25_tulip_bubble|Dutch merchants trading tulips in a frenzy, 1642"
  "26_cottingley_fairies|Young girls with glowing fairies in a garden, 1955"
  "27_guillotine_execution|Last public guillotine execution in a town square, 1826"
  "28_ghost_army|Inflatable rubber tanks and fake military equipment, 1943"
  "29_mothman|Mysterious winged creature with red eyes in fog, 1967"
  "30_whitehead_flight|Early flying machine taking off before the Wright brothers, 1903"
  "31_ghost_army_patton|Ghostly military deception operation with fake tanks, 1944"
  "32_st_albans_raid|Confederate soldiers raiding a quiet Vermont town, 1864"
  "33_plane_crash_survivor|Woman surviving a plane fall from the sky, 1977"
  "34_flagellants|Flagellant monks marching and whipping themselves, 1348"
  "35_lion_harrods|A man walking a full grown lion through a luxury department store, 1971"
  "36_camel_experiment|Camels in the American desert with military riders, 1860"
  "37_lost_eleven_days|British citizens rioting about lost calendar days, 1752"
  "38_johnstown_flood|A massive flood destroying a town, 1895"
  "39_elephants_war|War elephants charging through a battlefield, 1916"
  "40_medical_prank|Surgeons in an operating room pulling off an elaborate prank, 1928"
  "41_rat_trial|Medieval courtroom putting animals on trial, 1386"
  "42_double_atomic_survivor|A man standing between two mushroom clouds, 1962"
  "43_rabbit_birth|A woman in a medical bed surrounded by rabbits, 1809"
  "44_irish_famine|Starving Irish peasants in a potato field, 1845"
  "45_veronese_inquisition|A Venetian painter defending his art before the Inquisition, 1573"
  "46_thylacine|The last Tasmanian tiger in a barren cage, 1936"
  "47_tamagotchi|People obsessing over small digital pet devices, 1995"
)

for entry in "${PAINTINGS[@]}"; do
  IFS='|' read -r filename desc <<< "$entry"
  filepath="paintings/${filename}.png"
  if [ -f "$filepath" ] && [ $(stat -c%s "$filepath") -gt 1000 ]; then
    echo "SKIP: $filepath (exists)"
    continue
  fi
  echo "GEN: $filepath - $desc"
  z-ai-generate -p "Oil painting, classical European art, dramatic chiaroscuro, dark moody atmosphere, rich oil textures, baroque style historical masterpiece: $desc" -o "$filepath" -s 1024x1024 2>&1 | tail -1
  sleep 3
done

echo "DONE. Files: $(ls paintings/*.png 2>/dev/null | wc -l)"
