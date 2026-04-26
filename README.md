# Gamemaker switch ports

Discord: https://discord.gg/cc2YA2pChU

Buncha gamemaker ports for the switch!

## Compiling
Getting rewritten! but will use [ZeusNX](https://github.com/SoraStream/ZeusNX)

## Issues!!!!!

### **My Game Isn't saving**
Add this:
```gml
function fixed_ini_close(){
	ini_close();
	
	if os_type = os_switch
		switch_save_data_commit();
}
```
and replace all ini_close() with fixed_ini_close()

### **My video isn't working!**
I'll write this up later, but it is possble through some shader stuff

