# gpu2hwmon
Control case fans proportional to hwmon temperatures.

See [https://www.kernel.org/doc/html/latest/hwmon/nct6775.html](https://www.kernel.org/doc/html/latest/hwmon/nct6775.html) for supported chips. **Should** work with "Nuvoton NCT6775F, NCT6776F, and NCT6779D and compatible super I/O chips" among others.
- AMD GPU support - Yes
- Zenpower support - Yes
- Crossfire support - Yes Untested
- Nvidia GPU Support - No ( Nvidia may use the /sys file system in the future )
- Intel GPU support - Untested

Download and extract zip.

## Configure

### Edit gpu2hwmon.conf
Change SUPER_IO_NAME to your chip name. This is the chip that controls your fans.
*eg* `SUPER_IO_NAME="nct6775"`

Change Module names for temperature reading.
*eg `GPU_NAME=(amdgpu zenpower)`

Change PWM_ENABLE for your fan layout and numbers.
*eg* `PWM_ENABLE=(5 6)`

```
# /etc/gpu2hwmon.conf
# configuration file for gpu2hwmon.service

#### Module names to look for in /sys sub directorys.
# Module for fan control.
SUPER_IO_NAME="nct6797"

# Module/s for temperature reading.
GPU_NAME=(amdgpu zenpower)

# Array of pwm? in /sys/class/hwmon/hwmon? to manually control
PWM_ENABLE=(4 5)

# Array of module temperatures [°C * 1000], indices correspond to the gpu auto points [pwm]
GPU_TEMPS=(30000 35000 40000 45000 50000 55000 60000 65000 70000)
GPU_AUTO_POINTS=(80 88 96 112 128 160 196 224 255)
```
### Optional
Remove comment # from line 83 of gpu2hwmon if you want to spam the journal with gpu_temperature fan_id and pwm.

`echo "$CONTROL" "$INPUT" "$FAN" "$PWM"`

Edit GPU_TEMPS and GPU_AUTO_POINTS arrays to include more indices for a smoother fan control curve.
#### Note: *Both arrays must have the same number of indices*
## Install
```
sudo ./install.sh
```
## Uninstall
```
sudo ./uninstall.sh
```
## Monitor
```
systemctl status gpu2hwmon.service
```
```
journalctl -f -u gpu2hwmon.service
```
```
watch sensors nct6797-isa-0a20 amdgpu-pci-2800
```
### Return nct6797 to previous fan control mode, ie: BIOS
```
systemctl stop gpu2hwmon.service
```
