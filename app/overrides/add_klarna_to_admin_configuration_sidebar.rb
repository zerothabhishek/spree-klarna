Deface::Override.new(virtual_path:  "spree/admin/shared/_configuration_menu",
                     name:          "klarna_admin_configurations_menu",
                     insert_bottom: "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                     text:          "<%= configurations_sidebar_menu_item Spree.t(:settings, scope: :klarna), edit_admin_klarna_settings_path %>",
                     disabled:      false)
