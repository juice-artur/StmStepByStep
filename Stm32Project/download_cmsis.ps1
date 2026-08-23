$baseCube = "https://raw.githubusercontent.com/STMicroelectronics/STM32CubeF4/master"
$baseDevice = "https://raw.githubusercontent.com/STMicroelectronics/cmsis-device-f4/master"

$files = @(
    # CMSIS Core
    @{
        Url  = "$baseCube/Drivers/CMSIS/Include/core_cm4.h"
        Out  = "Drivers/CMSIS/Include/core_cm4.h"
    },
    @{
        Url  = "$baseCube/Drivers/CMSIS/Include/cmsis_version.h"
        Out  = "Drivers/CMSIS/Include/cmsis_version.h"
    },
    @{
        Url  = "$baseCube/Drivers/CMSIS/Include/cmsis_compiler.h"
        Out  = "Drivers/CMSIS/Include/cmsis_compiler.h"
    },
    @{
        Url  = "$baseCube/Drivers/CMSIS/Include/cmsis_gcc.h"
        Out  = "Drivers/CMSIS/Include/cmsis_gcc.h"
    },
    @{
        Url  = "$baseCube/Drivers/CMSIS/Include/mpu_armv7.h"
        Out  = "Drivers/CMSIS/Include/mpu_armv7.h"
    },

    # STM32F4 CMSIS Device
    @{
        Url  = "$baseDevice/Include/stm32f411xe.h"
        Out  = "Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f411xe.h"
    },
    @{
        Url  = "$baseDevice/Include/stm32f4xx.h"
        Out  = "Drivers/CMSIS/Device/ST/STM32F4xx/Include/stm32f4xx.h"
    },
    @{
        Url  = "$baseDevice/Include/system_stm32f4xx.h"
        Out  = "Drivers/CMSIS/Device/ST/STM32F4xx/Include/system_stm32f4xx.h"
    },

    # System source
    @{
        Url  = "$baseDevice/Source/Templates/system_stm32f4xx.c"
        Out  = "Src/system_stm32f4xx.c"
    }
)

foreach ($file in $files) {

    Write-Host "Downloading $($file.Out)..." -ForegroundColor Cyan

    $directory = Split-Path $file.Out -Parent

    New-Item `
        -ItemType Directory `
        -Force `
        -Path $directory | Out-Null

    Invoke-WebRequest `
        -Uri $file.Url `
        -OutFile $file.Out

    if ($?) {
        Write-Host "OK" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "CMSIS files downloaded successfully!" -ForegroundColor Green
