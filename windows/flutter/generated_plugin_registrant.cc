//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <charset_converter/charset_converter_plugin.h>
#include <maxx_sunmi_printer/maxx_sunmi_printer_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  CharsetConverterPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("CharsetConverterPlugin"));
  MaxxSunmiPrinterPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("MaxxSunmiPrinterPlugin"));
}
