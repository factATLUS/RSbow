#弓を持った
execute as @a[nbt={Inventory:[{tag:{ItemName:RSbow}}]}] at @s run function rsbow:position
execute as @a[nbt={Inventory:[{Slot:-106b,tag:{ItemName:RSbow}}]}] at @s run function rsbow:position

#version取得
##execute positioned 0 -63 0 if block ~ ~ ~ air run 
function rsbow:setblock

#矢のデータ
##execute as @e[type=arrow,tag=rsarrow] run data merge entity @s {CustomPotionEffects:[{Id:2,Amplifier:9b,Duration:40},{Id:15,Amplifier:0b,Duration:60}],CustomPotionColor:16724787}
##execute as @a[nbt={Inventory:[{id:"minecraft:tipped_arrow",tag:{display:{Name:'{"text":"クラフト不可能な効能付きの矢"}'},CustomPotionEffects:[{Id:2,Amplifier:9b,Duration:40},{Id:15,Amplifier:0b,Duration:60}]}}]}] run function rsbow:collect

advancement revoke @r only rsbow:tick