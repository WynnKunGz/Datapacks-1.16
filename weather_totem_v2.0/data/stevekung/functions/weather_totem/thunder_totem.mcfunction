# craft thunder totem
execute as @e[type=armor_stand,tag=adv_crafting_table] at @s if block ~ ~1 ~ dropper[facing=down]{CustomName:'{"italic":false,"color":"blue","text":"Advanced Crafting Table"}',Items:[{Slot:0b,id:"minecraft:snowball",Count:1b},{Slot:2b,id:"minecraft:water_bucket",Count:1b},{Slot:4b,id:"minecraft:totem_of_undying",Count:1b},{Slot:7b,id:"minecraft:nether_star",Count:1b}]} run data merge block ~ ~1 ~ {Items:[{id:"minecraft:totem_of_undying",Count:1b,Slot:4b,tag:{IsThunderTotem:1b,CustomModelData:2553,display:{Name:'{"text":"Thunder Totem","color":"blue","italic":"false"}',Lore:['{"text":"Raining IV","color":"gray","italic":"false"}','{"text":"Thunder V","color":"gray","italic":"false"}','""','{"text":"Create raining and thunder storm for 30 minutes","color":"green","italic":"false"}']}}}]}