{ ... }:

{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        completion.menu.draw.columns = [ [ "label" "label_description" ] ];
        keymap = {
          "<C-j>" = [
            "show"
            "select_next"
          ];
          "<C-k>" = [
            "select_prev"
            "fallback"
          ];
          "<C-l>" = [
            "select_and_accept"
            "fallback"
          ];
        };
      };
    };
  };
}
