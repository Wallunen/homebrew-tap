class ZigDev < Formula
  os = "macos"

  bottle do
    root_url "https://github.com/Wallunen/homebrew-tap/releases/download/bottles-update-20260802-021204"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5cd514910c88f88aa2c16bf8138a01620ad83db2a57d8837a72f360f9afad683"
    sha256 cellar: :any_skip_relocation, sequoia:      "c632af942ac5ac38cedfd89714d770ac8253c8caf2cd4c79c5109eba6a5efea1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "2decb4ce8062d0359631eeabf758bfd11bd069f215bc499d57cf016093030d68"
  end

  arch = "x86_64"

  if OS.mac?
    if Hardware::CPU.intel?
      sha256 "0d637250297833234c44e66dca71455cae774659a9537aad6ccabbdab75b6571" # x86_64-macos
    else
      arch = "aarch64"
      sha256 "7284f4c3dd6efc8881225fcebe45e85f77c999748d73f895e72d3c6fcfb9fe8d" # aarch64-macos
    end
  else
    os = "linux"
    sha256 "d3cb1d1dbe825ec5cb924b0c399ce0dfbdd27a61ae1097e272bee9f1ca07b311" # x86_64-linux
  end

  desc "Development build of the Zig programming language"
  homepage "https://ziglang.org/"
  url "https://ziglang.org/builds/zig-#{arch}-#{os}-0.17.0-dev.1516+8a4b5424d.tar.xz"
  version "0.17.0-dev.1516+8a4b5424d"
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
