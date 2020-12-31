## How to fix the HDMI diaplay on Ubuntu 18.04
### 1. Run: xrandr
```
Screen 0: minimum 8 x 8, current 3840 x 1080, maximum 32767 x 32767
DP-0 disconnected (normal left inverted right x axis y axis)
HDMI-0 connected 1920x1080+0+0 (normal left inverted right x axis y axis) 476mm x 268mm
   1920x1080     60.00*+  74.97    59.94    50.00  
   1680x1050     59.95  
   1600x900      60.00  
   1440x900      59.89  
   1280x1024     60.02  
   1280x800      59.81  
   1280x720      60.00    59.94    50.00  
   1024x768      60.00  
   800x600       60.32  
   720x576       50.00  
   720x480       59.94  
   640x480       59.94    59.93  
DP-1 connected primary 1920x1080+1920+0 (normal left inverted right x axis y axis) 344mm x 193mm
   1920x1080     60.01*+  40.00  
DP-2 disconnected (normal left inverted right x axis y axis)

```
- if does not work then :
```
sudo nano /etc/default/grub
#GRUB_GFXMODE=640x480 --> GRUB_GFXMODE=1920x1080 
sudo update-grub
sudo reboot
```
or
```
xrandr --output default --gamma 0:0:0 --mode 1920x1080
```

###  2. Run inxi -G
```
Graphics:  Card: NVIDIA Device 1fb8
           Display Server: x11 (X.Org 1.20.8 ) drivers: nvidia (unloaded: modesetting,fbdev,vesa,nouveau)
           Resolution: 1920x1080@60.00hz, 1920x1080@60.01hz
           OpenGL: renderer: Quadro T2000/PCIe/SSE2 version: 4.6.0 NVIDIA 455.45.01

```
-  if command is not recognized then install inxi
```
sudo apt-get update
sudo apt-get install inxi
```

```
sudo apt-get install nvidia-361
pidof Xorg
sudo kill -9 <pid1> <pid2>
```

### 3. If it does not work then update the nvidia drivers:
```
sudo apt-get purge 'nvidia*'
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
```
- Then go to software & updates and additional drivers 
- Select the nvidia-driver-544 (proprietary,tested)
