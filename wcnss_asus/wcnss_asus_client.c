/*
 * Copyright (C) 2016, The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

//#define LOG_NDEBUG 0

#define LOG_TAG "wcnss_asus"

#define SUCCESS 0
#define FAILED -1

#define MAC_ADDR_PATH "/factory/wifi.nv"
#define MAC_ADDR_PATH "/factory/wifimac.txt"
#define GENMAC_FILE "/persist/.genmac"
#define MAC_ADDR_SIZE 12
#define MAX_WAIT_COUNT 10
#define WAIT_TIME 1000000

#include <log/log.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>

static const char asus_mac_prefix[] = { 0x2c, 0x56, 0xdc };

int wcnss_init_qmi(void)
{
    /* empty */
    return SUCCESS;
}

int wcnss_qmi_get_wlan_address(unsigned char *pBdAddr)
{
    int fd, ret;
    int i = 0, success = 0;
    char buf[12];
    struct stat mac_stat;

    while (stat(MAC_ADDR_PATH, &mac_stat) && i < MAX_WAIT_COUNT) {
        usleep(WAIT_TIME);
        i++;
    }

    if (i == MAX_WAIT_COUNT) {
        ALOGE("Failed to obtain MAC address from NV\n");
    } else {
        fd = open(MAC_ADDR_PATH, O_RDONLY);
        if (fd < 0) {
            ALOGE("Failure opening MAC path: %d\n", errno);
        } else {
            ret = read(fd, buf, 12);
            if (ret < 0) {
                ALOGE("Failure to read MAC data: %d\n", errno);
            } else {
                sscanf(buf, "%02hhx%02hhx%02hhx%02hhx%02hhx%02hhx",
                    &pBdAddr[0], &pBdAddr[1], &pBdAddr[2],
                    &pBdAddr[3], &pBdAddr[4], &pBdAddr[5]);

                ALOGI("Successfully read MAC from NV data");
                success = 1;
            }
            close(fd);
        }
    }

    // Use a previously stored value on failure (if it exists)
    if (!success && !stat(GENMAC_FILE, &mac_stat)) {
        FILE *genmac = fopen(GENMAC_FILE,"r");
        if (fscanf(genmac, "%c%c%c%c%c%c",
                &pBdAddr[0], &pBdAddr[1], &pBdAddr[2],
                &pBdAddr[3], &pBdAddr[4], &pBdAddr[5]) == 6) {
            ALOGE("Successfully read local MAC address");
            success = 1;
        }
        fclose(genmac);
    }

    // If that fails as well, randomize a MAC
    if (!success) {
        memcpy(pBdAddr, asus_mac_prefix, sizeof(asus_mac_prefix));

        // We don't need strong randomness, and if the NV is corrupted
        // any hardware values are suspect, so just seed it with the
        // current time
        srand(time(NULL));

        for (i = sizeof(asus_mac_prefix) / sizeof(asus_mac_prefix[0]); i < MAC_ADDR_SIZE; i++) {
            pBdAddr[i] = rand() % 255;
        }

        ALOGI("Using randomized MAC address");

        // Store for reuse
        FILE *genmac = fopen(GENMAC_FILE, "w");
        fwrite(pBdAddr, 1, MAC_ADDR_SIZE, genmac);
        fclose(genmac);
    }

    ALOGI("Using MAC address: %02hhx:%02hhx:%02hhx:%02hhx:%02hhx:%02hhx\n",
            pBdAddr[0], pBdAddr[1], pBdAddr[2],
            pBdAddr[3], pBdAddr[4], pBdAddr[5]);

    return SUCCESS;
}

void wcnss_qmi_deinit(void)
{
    /* empty */
}
