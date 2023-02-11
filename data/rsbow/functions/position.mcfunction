#弓で打った矢をタグ付け
execute if entity @a[scores={use_RSbow=1..}] if entity @e[type=arrow,limit=1,sort=nearest,distance=..3] run data merge entity @e[type=arrow,limit=1,sort=nearest] {Tags:["rsarrow"]}

#タグ付けされた矢の1tick前位置を取得
execute as @e[tag=rsarrow,type=arrow,nbt={inGround:0b}] at @s run summon marker ~ ~ ~ {Tags:["rsposition"]}
tag @e[tag=rsposition,type=marker] remove nearest
execute as @e[tag=rsarrow,type=arrow] at @s run tag @e[tag=rsposition,type=marker,limit=1,sort=nearest] add nearest
kill @e[tag=rsposition,tag=!nearest,type=marker]

#矢が刺さっているブロックを取得
execute as @e[type=arrow,tag=rsarrow,nbt={inGround:1b,OnGround:0b}] at @s facing entity @e[tag=rsposition,limit=1,sort=nearest] feet run tp ^ ^ ^-0.1
execute as @e[type=arrow,tag=rsarrow,nbt={inGround:1b,OnGround:1b}] at @s align xyz run summon marker ~0.5 ~0.5 ~0.5 {Tags:["onBlock"]}
execute as @e[type=marker,tag=onBlock] at @s run particle dust 1 0 0 0.8 ~ ~ ~ 0.25 0.25 0.25 2 1 force
execute as @e[type=marker,tag=onBlock] at @s run particle dust 0 0.6 1.1 0.5 ~ ~ ~ 0.25 0.25 0.25 1 1 force


scoreboard players reset @a[scores={use_RSbow=1..}] use_RSbow
