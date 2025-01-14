import fs from "fs";
import { KarabinerRules } from "./types";
import { app, createHyperSubLayers, open } from "./utils";

const rules: KarabinerRules[] = [
  // Define the Hyper key itself
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "Caps Lock -> Hyper Key",
        from: {
          key_code: "caps_lock",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            set_variable: {
              name: "hyper",
              value: 1,
            },
          },
        ],
        to_after_key_up: [
          {
            set_variable: {
              name: "hyper",
              value: 0,
            },
          },
        ],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
        type: "basic",
      },
      //      {
      //        type: "basic",
      //        description: "Disable CMD + Tab to force Hyper Key usage",
      //        from: {
      //          key_code: "tab",
      //          modifiers: {
      //            mandatory: ["left_command"],
      //          },
      //        },
      //        to: [
      //          {
      //            key_code: "tab",
      //          },
      //        ],
      //      },
    ],
  },
  ...createHyperSubLayers({
    o: {
      b: app("Arc"),
      s: app("Spotify"),
      i: app("Ghostty"),
      t: app("Telegram"),
      v: app("Visual Studio Code"),
      f: app("Figma"),
    },

    // r = "Raycast"
    r: {
      p: open("raycast://extensions/raycast/raycast/confetti"),
      h: open(
        "raycast://extensions/raycast/clipboard-history/clipboard-history"
      ),
    },
  }),
];

fs.writeFileSync(
  "karabiner.json",
  JSON.stringify(
    {
      global: {
        show_in_menu_bar: false,
      },
      profiles: [
        {
          name: "Default",
          devices: [
            {
              disable_built_in_keyboard_if_exists: true,
              identifiers: {
                is_keyboard: true,
                product_id: 668,
                vendor_id: 76,
              },
            },
          ],
          selected: true,
          virtual_hid_keyboard: {
            country_code: 0,
            keyboard_type_v2: "ansi",
          },
          complex_modifications: {
            rules: [
              ...rules,
              {
                description:
                  "Double tapping left_shift toggles the caps_lock function.",
                manipulators: [
                  {
                    conditions: [
                      {
                        name: "left_shift_pressed",
                        type: "variable_if",
                        value: 1,
                      },
                    ],
                    from: {
                      key_code: "left_shift",
                      modifiers: { optional: ["any"] },
                    },
                    to: [
                      {
                        key_code: "spacebar",
                        modifiers: ["left_control", "left_option"],
                      },
                    ],
                    type: "basic",
                  },
                  {
                    from: {
                      key_code: "left_shift",
                      modifiers: { optional: ["any"] },
                    },
                    to: [
                      {
                        set_variable: {
                          name: "left_shift_pressed",
                          value: 1,
                        },
                      },
                      { key_code: "left_shift" },
                    ],
                    to_delayed_action: {
                      to_if_canceled: [
                        {
                          set_variable: {
                            name: "left_shift_pressed",
                            value: 0,
                          },
                        },
                      ],
                      to_if_invoked: [
                        {
                          set_variable: {
                            name: "left_shift_pressed",
                            value: 0,
                          },
                        },
                      ],
                    },
                    type: "basic",
                  },
                ],
              },
            ],
          },
        },
        {
          name: "Empty",
          virtual_hid_keyboard: { country_code: 0 },
        },
      ],
    },
    null,
    2
  )
);
