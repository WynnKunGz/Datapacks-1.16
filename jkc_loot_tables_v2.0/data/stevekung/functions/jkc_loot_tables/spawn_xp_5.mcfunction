data remove entity @s Item.tag.SpawnXP
execute as @a[gamemode=survival,scores={jkc_loot.ticks=0..2}] run summon experience_orb ~ ~ ~ {Value:5}