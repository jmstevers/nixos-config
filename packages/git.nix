{
  programs.git = {
    enable = true;
    config = {
      init.defaultBranch = "main";

      user = {
        name = "Johnathan Stevers";
        email = "jmstevers@gmail.com";
      };

      url."https://github.com/".insteadOf = [
        "gh:"
        "github:"
      ];
    };
  };
}
