{
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "Johnathan Stevers";
        email = "jmstevers@gmail.com";
      };
      init = {
        defaultBranch = "main";

      };
      url = {
        "https://github.com/" = {
          insteadOf = [
            "gh:"
            "github:"
          ];
        };
      };
    };
  };
}
