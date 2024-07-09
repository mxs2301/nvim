local config = {
  cmd = { "/nix/store/d99mag8kj4405xdh8jvvn8yhdsgkgbas-profile/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", "mvnw" }, { upward = true })[1]),

  init_options = {
    bundles = {
      vim.fn.glob(
        "/home/max/Software/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
        1
      ),
    },
  },
}

require("jdtls").start_or_attach(config)
