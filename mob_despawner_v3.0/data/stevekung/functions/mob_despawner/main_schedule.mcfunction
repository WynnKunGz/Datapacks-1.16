# trigger
scoreboard players enable @a despawner.trigg
execute as @a[scores={despawner.trigg=1..},gamemode=!spectator] at @s run function stevekung:mob_despawner/events/trigger

# detect structure block
execute as @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] at @s unless entity @e[type=area_effect_cloud,tag=mob_despawner,distance=..64] if entity @e[type=item,nbt={Item:{id:"minecraft:diamond_sword"}},limit=1,distance=..0.5] if block ~ ~-1 ~ end_rod[facing=down] if block ~ ~-2 ~ end_rod[facing=up] if block ~ ~-3 ~ iron_block if block ~ ~-4 ~ emerald_block run function stevekung:mob_despawner/summon_despawner

# detect mini structure block
execute as @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] at @s unless entity @e[type=area_effect_cloud,tag=mini_mob_despawner,distance=..32] if entity @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}},limit=1,distance=..0.5] if block ~ ~-1 ~ iron_bars if block ~ ~-2 ~ iron_bars if block ~ ~-3 ~ iron_block if block ~ ~-4 ~ gold_block run function stevekung:mob_despawner/summon_mini_despawner

# check if despawner is nearby
execute as @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] at @s if entity @e[type=area_effect_cloud,tag=mob_despawner,distance=..64] if entity @e[type=item,nbt={Item:{id:"minecraft:diamond_sword"}},limit=1,distance=..0.5] if block ~ ~-1 ~ end_rod[facing=down] if block ~ ~-2 ~ end_rod[facing=up] if block ~ ~-3 ~ iron_block if block ~ ~-4 ~ emerald_block run title @a[distance=..8] actionbar {"text":"Cannot build! Other nearby mob despawner detected.","color":"red"}

execute as @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] at @s if entity @e[type=area_effect_cloud,tag=mini_mob_despawner,distance=..32] if entity @e[type=item,nbt={Item:{id:"minecraft:iron_sword"}},limit=1,distance=..0.5] if block ~ ~-1 ~ iron_bars if block ~ ~-2 ~ iron_bars if block ~ ~-3 ~ iron_block if block ~ ~-4 ~ gold_block run title @a[distance=..8] actionbar {"text":"Cannot build! Other nearby mini mob despawner detected.","color":"red"}

# glow entity around
execute as @e[type=area_effect_cloud,tag=mob_despawner] at @s if score @s despawner.gticks matches 1.. run effect give @e[tag=!mob_despawner_base,distance=..64] glowing 2 0 true
execute as @e[type=area_effect_cloud,tag=mini_mob_despawner] at @s if score @s despawner.gticks matches 1.. run effect give @e[tag=!mob_despawner_base,distance=..32] glowing 2 0 true

# fix score if entity unloaded
execute as @e[type=area_effect_cloud,tag=mob_despawner_base] unless entity @s[scores={despawner.x=-30000000..30000000}] run execute store result score @s despawner.x run data get entity @s Pos[0]
execute as @e[type=area_effect_cloud,tag=mob_despawner_base] unless entity @s[scores={despawner.y=0..256}] run execute store result score @s despawner.y run data get entity @s Pos[1]
execute as @e[type=area_effect_cloud,tag=mob_despawner_base] unless entity @s[scores={despawner.z=-30000000..30000000}] run execute store result score @s despawner.z run data get entity @s Pos[2]
execute as @e[type=area_effect_cloud,tag=mob_despawner_base] unless entity @s[scores={despawner.dim=-1..1}] run execute store result score @s despawner.dim run data get entity @s Dimension

###### creative ######
# despawn mobs
execute as @e[type=area_effect_cloud,tag=mob_despawner_creative] at @s run function stevekung:mob_despawner/events/despawning_entities_64
execute as @e[type=area_effect_cloud,tag=bat_despawner] at @s run execute as @e[type=bat,distance=..64] unless data entity @s CustomName run tp @s ~ ~-200 ~

# run loop
schedule function stevekung:mob_despawner/main_schedule 20t