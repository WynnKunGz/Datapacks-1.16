# craft trash bin
execute if block ~ ~ ~ dropper[facing=down]{CustomName:'{"italic":false,"color":"blue","text":"Advanced Crafting Table"}',Items:[{Slot:1b,id:"minecraft:ender_eye",Count:1b},{Slot:4b,id:"minecraft:dropper",Count:1b}]} run data merge block ~ ~ ~ {Items:[{id:"minecraft:iron_ingot",Count:1b,Slot:4b,tag:{TrashBin:1b,CustomModelData:2612,display:{Name:'{"text":"Trash Bin","color":"dark_gray","italic":false}',Lore:['{"text":"Used to remove unused items","color":"gold","italic":false}','{"text":"Delete items every 10 seconds","color":"gold","italic":false}','{"text":"To use drop block on the ground","italic":false,"color":"gold"}']}}}]}