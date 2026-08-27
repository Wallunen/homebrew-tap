class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260826-005759"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "390f70e3a82b9e4b658e2a7e26889933d1c0a250a2c223063e2d1394f2f47bfe"
    sha256 cellar: :any_skip_relocation, sequoia:      "9004d7eeb59b1c96fb1b476a08534846e1fedd30d661408be1ddaf3bc081b218"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c6ad98de164e61cf2185682942cb427870f81423db5954ea4722ca11aee2d91a"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "a5fc597285feb2893e311f66aebb678798eea41441e6e1292d1efc8496060ec4" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "944c65ede040ed17aff9e3598fa3762b4b0cb8959102c09f67be386d92eb3b26" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "223bc256d7ae81e5a6cb038cc2cd5db80b8485d53e8e7fd3a6516d418586ff92" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1884+841dd0eb8.tar.xz"
  version "0.17.0-dev.1884+841dd0eb8"
  license "MIT"

  livecheck do
    skip "Dynamic `url` and `sha256`"
  end

  depends_on macos: :big_sur # https://github.com/ziglang/zig/issues/13313
  depends_on "z3"
  depends_on "zstd"

  uses_from_macos "ncurses"
  uses_from_macos "zlib"

  conflicts_with "zig", because: "both install a `zig` binary"

  def install
    bin.install "zig"
    lib.install "lib" => "zig"
  end
end
