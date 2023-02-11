#矢が刺さっているブロックを置換
execute as @e[type=marker,tag=onBlock] at @s unless block ~ ~ ~ redstone_block run clone ~ ~ ~ ~ ~ ~ ~ -64 ~ replace force
execute as @e[type=marker,tag=onBlock] at @s run setblock ~ ~ ~ redstone_block
execute as @e[type=marker,tag=onBlock] at @s unless entity @e[type=arrow,tag=rsarrow,distance=..1] run clone ~ -64 ~ ~ -64 ~ ~ ~ ~ replace force
execute as @e[type=marker,tag=onBlock] at @s unless entity @e[type=arrow,tag=rsarrow,distance=..1] run setblock ~ -64 ~ bedrock


#
scoreboard players add @e[type=marker,tag=onBlock] use_RSbow 1
kill @e[type=marker,tag=onBlock,scores={use_RSbow=2..}]
