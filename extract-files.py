#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
     'hardware/qcom-caf/sm8350',
     'hardware/xiaomi',
     'vendor/qcom/opensource/display',
     'vendor/xiaomi/sm8350-common',
     'vendor/xiaomi/venus',
]

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None


lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
    ): lib_fixup_vendor_suffix,
}

blob_fixups: blob_fixups_user_type = {
    'vendor/etc/camera/pureShot_parameter.xml': blob_fixup()
        .regex_replace(r'=(\d+)>', r'="\1">'),
    'vendor/etc/libnfc-nxp.conf': blob_fixup()
        .regex_replace(r'NXP_T4T_NFCEE_ENABLE=0x01', r'NXP_T4T_NFCEE_ENABLE=0x00'),
    'vendor/lib64/hw/camera.qcom.so': blob_fixup()
        .binary_regex_replace(b'\x73\x74\x5F\x6C\x69\x63\x65\x6E\x73\x65\x2E\x6C\x69\x63', b'\x63\x61\x6D\x65\x72\x61\x5F\x63\x6E\x66\x2E\x74\x78\x74')
        .add_needed('libprocessgroup_shim.so'),
    'vendor/lib64/hw/camera.xiaomi.so': blob_fixup()
        .sig_replace('AA 06 00 94', '1F 20 03 D5'),
    'vendor/lib64/hw/com.qti.chi.override.so': blob_fixup()
        .add_needed('libprocessgroup_shim.so'),
    'vendor/lib64/vendor.qti.hardware.camera.postproc@1.0-service-impl.so': blob_fixup()
        .sig_replace('8D 0A 00 94', '1F 20 03 D5'),
    'vendor/lib64/vendor.xiaomi.hardware.cameraperf@1.0-impl.so': blob_fixup()
        .sig_replace('7C 00 00 94', '1F 20 03 D5'),
}  # fmt: skip

module = ExtractUtilsModule(
    'venus',
    'xiaomi',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
